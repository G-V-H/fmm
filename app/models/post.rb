class Post < ApplicationRecord
  belongs_to :product
  validates :product_id, :price_per_unit, :units_available, :city, :state, presence: true
  has_one_attached :picture
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
