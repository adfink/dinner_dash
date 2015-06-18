require 'rails_helper'

RSpec.describe Order, type: :model do

  it "user can see the total price per order" do
    order = Order.create

    beef = Item.create(title: "beef", description: "rare", price: 10.00)
    strawberry = Item.create(title: "strawberries", description: "plump, red and sweet", price: 4.00)
    order.order_items.create(item_id: beef.id, quantity: 2)
    order.order_items.create(item_id: strawberry.id, quantity: 1)

    expect(order.total_price).to eq(24.00)
  end
end
