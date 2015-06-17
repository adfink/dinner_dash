require 'rails_helper'

describe "user has access to their orders", type: :feature do
  before :each do
    @user  = User.create(full_name: "Chelsea May", email: "cdub@gmail.com", password: "password")
    @order = @user.orders.create
    @order.items.create(title: "strawberries", description: "plump, red and sweet", price: 400)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  it "user can see their orders" do
    visit profile_path
    expect(current_path).to eq(profile_path)
    expect(page).to have_content("1 item(s)")
    # expect(page).to have_content("Finker")
  end

  it "user can click on an order and go get more info about that order" do
    visit profile_path
    click_link("view this order")

    expect(current_path).to eq(order_path(@order))
    expect(page).to have_content("a little bit of information about your order...")
  end

end

# items with quantity ordered and line-item subtotals
# links to each item description page

# order total price
# date/time order was submitted
# if completed or cancelled, display a timestamp when that action took place
# if any item is retired from the menu:
#   they can still access the item page
#   they cannot add it to a new cart
