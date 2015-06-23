class Category < ActiveRecord::Base
  has_many :category_items
  has_many :items, through: :category_items
  validates :name, presence: true, uniqueness: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      self.all
    end 
  end
end
