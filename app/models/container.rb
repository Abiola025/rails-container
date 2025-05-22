class Container < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :photo, presence: true
  validates :name, presence: true, uniqueness: {scope: :user_id, message: "You have already created a container with this name"}
  validates :detail, presence: true, length: { minimum: 15 }
  validates :height,:width,:length, presence: true, format: { with: /\A\d+\.?\d{0,2}\z/, message: "enter to Maximum of 2 decimal places e.g. 1.25"}, numericality: {greater_than_or_equal_to: 1}
  validates :maximum_weight,:empty_weight, presence: true, format: { with: /\A\d+\.?\d{0,2}\z/, message: "enter to Maximum of 2 decimal places e.g. 1.25"}, numericality: {greater_than_or_equal_to: 1}
  validates :daily_price, presence: true, format: { with: /\A\d+\.?\d{0,2}\z/, message: "enter to Maximum of 2 decimal places e.g. 1.25"}, numericality: {greater_than_or_equal_to: 1}
end
