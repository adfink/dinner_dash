require 'rails_helper'

describe "cart", type: :feature do

  before :each do
    @category = Category.create(name: "dairy")
    @category.items.create(title: "sour cream", description: "this cream is sour", price: 4.75)
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
end
