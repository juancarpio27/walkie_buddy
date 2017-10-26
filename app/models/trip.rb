class Trip < ApplicationRecord

  enum status: [:pending, :completed, :canceled]

  belongs_to :user
  belongs_to :walker

  has_one :location

  has_many :pet_trips, dependent: :destroy
  has_many :pets, through: :pet_trips

  before_save :calculate_finish
  before_save :calculate_price

  def calculate_finish
    if self.date
      self.finish_time = self.date + self.duration.minutes
    else
      nil
    end
  end

  def calculate_price
    self.price = self.duration * 10
  end

  def calculate_walker(location_id,date,end_date)

    walkers = Walker.where(location: location_id).joins(:trips)

    if walkers.any?
      self.walker = walkers.where.not('trips.date < ? and trips.finish_time > ? or trips.date < ? and trips.finish_time > ?',date,date,end_date,end_date).order("Random()").first
    else
      self.walker = Walker.where(location: location_id).order("Random()").first
    end
  end

end
