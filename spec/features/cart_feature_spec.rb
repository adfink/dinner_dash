require 'rails_helper'

describe "cart", type: :feature do

  before :each do
    @category = Category.create(name: "dairy")
    @category.items.create(title: "sour cream", description: "this cream is sour", price: 4.75)
    visit category_path(@category)
    click_button "add to cart"
  end

  it "can show it's contents" do
    visit category_path(@category)
    click_button "add to cart"

    expect(current_path).to eq(category_path(@category))
    page.find("#cart").click

    expect(current_path).to eq(cart_path)
    expect(page).to have_content("sour cream")
  end

  it "let's a logged-in user check out" do
    @user = User.create(full_name: 'B G', email: 'test@mail.com', password: 'password')
    ApplicationController.any_instance.stub(:current_user).and_return(@user) 

    visit category_path(@category)
    click_button "add to cart"
    visit cart_path

    expect(page).to have_link('checkout')

    click_link('checkout')
    expect(current_path).to eq(new_order_path)

    click_button('confirm checkout')
    expect(current_path).to eq(profile_path)
  end

  it "makes a user log in before they can check out" do
    visit category_path(@category)
    click_button "add to cart"
    visit cart_path
    click_link('checkout')

    expect(current_path).to eq(login_path)
    expect(page).to have_content("please log in before you check out")
  end

  it "lets the user change the quantity of an item in their cart" do
    visit category_path(@category)
    click_button "add to cart"
    visit cart_path
    fill_in("quantity", with: "3")
    click_button "update"

    expect(page).to have_content("your cart has been updated")
    expect(page).to have_selector("input[value='3']")
  end

  it "lets removes an item with an updated quantity of zero" do
    visit category_path(@category)
    click_button "add to cart"
    visit cart_path
    fill_in("quantity", with: "0")
    click_button "update"

    expect(page).to have_content("your cart has been updated")
    expect(page).not_to have_content("sour cream")
    expect(page).not_to have_selector("input[value='0']")
  end
end
