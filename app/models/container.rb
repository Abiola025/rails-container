class Container < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  #has_many association needed
  #needs validations
end
