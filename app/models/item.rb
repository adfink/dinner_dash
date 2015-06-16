class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items
  validates :description, presence: true
  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
end
