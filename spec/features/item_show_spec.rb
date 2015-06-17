require 'rails_helper'

describe "item show page", type: :feature do
  before :each do
    @item = Item.create(title: "cheese soup", description: "yummy", price: 6.50)
    @item.categories.create(name: "soup")
    @item.categories.create(name: "cheese")
  end

  it "displays all the items information" do
    visit item_path(@item)

    assert page.has_content?("cheese soup")
    assert page.has_content?("price: $6.50")
    assert page.has_link?("cheese")
    assert page.has_link?("soup")
  end
end
