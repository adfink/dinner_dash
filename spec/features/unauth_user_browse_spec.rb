require 'rails_helper'

describe "unauthorized user browsing", type: :feature do
  it "can view the landing page" do
    visit root_path

    assert page.has_content?("Farm to Table")
    assert page.has_link?("login")
    assert page.has_link?("new farmhand")
    assert page.has_link?("menus")
  end

  it "can browse menus" do
    category = Category.create(name: "fruit")

    visit root_path
    click_link("menus")

    expect(current_path).to eq(categories_path)
    assert page.has_link?(category.name)
  end
end
