require 'rails_helper'

describe "admin index page", type: :feature do

  before :each do
    @user = User.create(full_name:"Chelsea May",
                            email:"chelsmay@gmail.com",
                         password:"password",
                             role: 1)
    @order = Order.create(status: "paid")
  ApplicationController.any_instance.stub(:current_user).and_return(@user)
  visit admin_orders_path
  end

  it "admin can visit /orders page" do
    expect(current_path).to eq(admin_orders_path)
    expect(page).to have_content("Orders")
  end

  it "total number of orders by status" do
    expect(page).to have_content("paid")
    assert "paid", @order.status
    assert 1, Order.all.paid.count
  end

  it "can go to each individual order" do
    click_link("view this order")
    expect(current_path). to eq(admin_order_path(@order))
  end

  it "can change the status" do
    expect(page).to have_content("paid")
    # expect(page).to have_select('paid', selected: 'cancelled')
    #make this work
  end
end
