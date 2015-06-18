require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  it "user can see the total price per order" do
    item = Item.create(title: "beef", description: "rare", price: 10.00)
    order_item = item.order_items.create(quantity: 1)
    
    expect(order_item.total_price).to eq(10.00)
  end
end
