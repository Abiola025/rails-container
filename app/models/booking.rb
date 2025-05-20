class Booking < ApplicationRecord
  belongs_to :container
  belongs_to :user
end
