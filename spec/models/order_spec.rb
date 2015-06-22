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

  it "display status returns date when appropriate" do
    order = Order.create(status: 3)
    order_two = Order.create

    expect(order.display_status).to eq("completed at #{order.updated_at}")
    expect(order_two.display_status).to eq("ordered")
  end
end
