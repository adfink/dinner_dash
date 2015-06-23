require 'rails_helper'

describe "admin index page", type: :feature do

  before :each do
    @user  = User.create(full_name: "Chelsea May", email: "cdub@gmail.com", password: "password", role: 1)
    @order = @user.orders.create(status: "ordered")
    @item = @order.items.create(title: "strawberries", description: "plump, red and sweet", price: 4.00)
    @order.items.create(title: "blueberries", description: "plump, blue and sweet", price: 8.00)
    @order.order_items.first.update_attribute(:quantity, 1)
    @order.order_items.last.update_attribute(:quantity, 1)

    ApplicationController.any_instance.stub(:current_user).and_return(@user)

    visit admin_order_path(@order)
  end

  it "can see order date and time" do
    expect(page).to have_content(@order.created_at)
  end

  it "can see purchasers full name" do
    expect(page).to have_content("Chelsea May")
  end

  it "can see purchasers email" do
    expect(page).to have_content("cdub@gmail")
  end

  it "can go to the item" do
    expect(page).to have_content("strawberries")
    click_link("strawberries")
    expect(current_path).to eq(item_path(@item))
  end

  it "can see the quantity of each item" do
    expect(page).to have_content(1)
  end

  it "can see the line item subtotal price" do
    expect(page).to have_content($4)
  end

  it "can see the total price for the order" do
    expect(page).to have_content($12)
  end

  it "can see the status of an order" do
    expect(page).to have_content("ordered")
  end
end
