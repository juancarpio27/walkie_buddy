class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def create
    @pet = User.find(params[:user_id]).pets.create(pet_params)
    if @pet.save
      redirect_to authenticated_root_path
    else
      new_user_pet_path(current_user)
    end
  end

  def edit
    @pet = User.find(params[:user_id]).pets.find(params[:id])
  end

  def update
    @pet = User.find(params[:user_id]).pets.find(params[:id])
    if @pet.update(pet_params)
      redirect_to authenticated_root_path
    else
      edit_user_pet_path(current_user,@pet)
    end
  end

  def destroy
    @pet = User.find(params[:user_id]).pets.find(params[:id])
    if @pet.destroy
      redirect_to authenticated_root_path
    else
      redirect_to authenticated_root_path
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :breed, :size, :avatar)
  end

end
