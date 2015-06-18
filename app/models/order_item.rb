class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  def total_price
    self.item.price * self.quantity
  end
end
