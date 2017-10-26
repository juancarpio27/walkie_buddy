class TripsController < ApplicationController

  def index
    @trips = current_user.trips
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.create(trip_params)
    @trip.calculate_walker(@trip.location_id,@trip.date,@trip.date+@trip.duration.minutes)
    if @trip.walker.blank?
      redirect_to new_user_trip_path(current_user,founded: 1)
      return
    end
    if @trip.save
      @trip.pending!
      redirect_to user_trip_path(current_user,@trip)
    else
      redirect_to new_user_trip_path(current_user)
    end
  end

  def show
    @trip = current_user.trips.find(params[:id])
  end

  def destroy
    @trip = current_user.trips.find(params[:id])
    @trip.canceled!
    redirect_to authenticated_root_path
  end

  private

  def trip_params
    params.require(:trip).permit(:location_id, :duration, :date, :address, :pet_ids => [])
  end


end
