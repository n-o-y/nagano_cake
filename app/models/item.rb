class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  attachment :image
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  validates :genre_id, presence: true
  def price_with_tax(price)
    price * 1.1
  end
end
