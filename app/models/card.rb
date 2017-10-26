class Card < ApplicationRecord

  belongs_to :user

  before_save :sanitize_params

  def sanitize_params
    self.number = self.number.last(4)
  end

end
