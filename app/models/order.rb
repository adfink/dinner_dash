class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  enum status: { ordered: 0, paid: 1, cancelled: 2, completed: 3 }
end
