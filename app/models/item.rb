class Item < ApplicationRecord
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :postage
  belongs_to :city
  belongs_to :shipping_date
end