require 'rails_helper'

describe "admin index page", type: :feature do

  before :each do
    @user = User.create(full_name:"Chelsea May",
                            email:"chelsmay@gmail.com",
                         password:"password",
                             role: 1)
  ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  it "admin can visit /orders page" do
    visit admin_orders_path

    expect(current_path).to eq(admin_orders_path)
    expect(page).to have_content("Orders")
  end

  it "total number of orders by status" do
    visit admin_orders_path

    expect(page).to have_content(total)
  end

end

# As an authorized admin
# when i visit '/orders'
# I See a listing of all orders with:
# the total number of orders by status
# links for each individual order
# filter orders to display by status type
# (for statuses "ordered", "paid", "cancelled", "completed")
#
# link to transition to a different status:
# link to "cancel" individual orders which are
# currently "ordered" or "paid"
# link to "mark as paid" orders which are "ordered"
# link to "mark as completed" individual orders which are
# currently "paid"
