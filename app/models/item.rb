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

  scope :active, -> { where(status: "active") }

  def part_of?(category)
    categories.include?(category)
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%") + where('description LIKE ?', "%#{search}%")
    else
      self.all
    end
  end

  def set_categories(category_ids)
    category_items.destroy_all
    category_ids.each do |id|
      category_items.find_or_create_by(category_id: id)
    end
  end
end
