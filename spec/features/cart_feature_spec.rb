require 'rails_helper'

describe "cart", type: :feature do

  before :each do
    @category = Category.create(name: "dairy")
    @category.items.create(title: "sour cream", description: "this cream is sour", price: 4.75)
  end

  it "can show it's contents" do
    visit category_path(@category)
    click_button "add to cart"
    click_link("cart")

    expect(current_path).to eq(new_order_path)
    expect(page).to have_content("sour cream")
  end

end
