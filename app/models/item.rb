class Item < ActiveRecord::Base
  has_many :category_items
  has_many :categories, through: :category_items
  validates :description, presence: true
  validates :title, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  has_many :order_items
  has_many :orders, through: :order_items
  has_attached_file :image, :default_url => "/images/default.jpg"
  validates_attachment_content_type :image, :content_type => [ "image/jpg", "image/jpeg", "image/png" ]

  def part_of?(category)
    categories.include?(category)
  end
end
