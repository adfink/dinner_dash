require 'rails_helper'

describe "user has access to their orders", type: :feature do
  before :each do
    user  = User.create(full_name: "Chelsea May", email: "cdub@gmail.com", password: "password")
    order = user.orders.create
    order.items.create(title: "strawberries", description: "plump, red and sweet", price: 400)
    ApplicationController.any_instance.stub(:current_user).and_return(user)
  end

  it "user can see their orders" do
    visit profile_path
    expect(current_path).to eq(profile_path)
    expect(page).to have_content("1 item(s)")
    # expect(page).to have_content("Finker")
  end
end

# As an authenticated user I expect to see a display page for my orders...
#
# As a user when I am on my profile page I expect to see a link to see all my orders
# I expect to click on that link and go to a page that displays all my orders
# I expect to see a link to an individual order and when I click on that link
#  I expect to got to a page that displays the following information about that order:
#
# items with quantity ordered and line-item subtotals
# links to each item description page
# the current status of the order
# order total price
# date/time order was submitted
# if completed or cancelled, display a timestamp when that action took place
# if any item is retired from the menu:
#   they can still access the item page
#   they cannot add it to a new cart
