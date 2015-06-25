require 'rails_helper'

describe "categories index and show", type: :feature do
  before :each do
    @category = Category.create(name: "cupcakes")
  end

  it "index shows all categories" do
    Category.create(name: "not cupcakes")
    visit categories_path

    assert page.has_content?("menus")
    expect(page).to have_css("#menulink")
  end

  it "is a link to its show page containing its items" do
    @category.items.create(title: "red velvet", description: "it's red!", price: 300)
    @category.items.create(title: "chocolate", description: "it's brown!", price: 200)
    visit categories_path
    find("#menulink").click

    expect(current_path).to eq(category_path(@category))
    expect(page).to have_content("cupcakes")
    expect(page).to have_link("red velvet")
    expect(page).to have_link("chocolate")
    expect(page).to have_link("menus")
  end
end
