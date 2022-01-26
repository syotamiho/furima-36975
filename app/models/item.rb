class Item < ApplicationRecord
  validates :title, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :postage_id, presence: true
  validates :city_id, presence: true
  validates :shipping_date_id, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end
