class PetTrip < ApplicationRecord

  belongs_to :pet
  belongs_to :trip

end
