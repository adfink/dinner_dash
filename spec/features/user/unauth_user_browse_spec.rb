require 'rails_helper'

describe "unauthorized user", type: :feature do
  it "can view the landing page" do
    visit root_path

    expect page.has_content?("Farm to Table")
    expect page.has_link?("login")
    expect page.has_link?("new farmhand")
    expect page.has_link?("Menu")
  end

  it "can browse menus" do
    category = Category.create(name: "fruit")
    visit root_path
    click_link("Menus")

    expect(current_path).to eq(categories_path)
  end

  it "can browse menu items" do
    category = Category.create(name: "fruit")
    item = category.items.create(title: "strawberry", description: "yummy", price: 100)

    visit categories_path
    find("#menulink").click

    expect(current_path).to eq(category_path(category))
    assert page.has_content?("strawberry")
  end

  it "can't see other users data" do
    user = User.create(email: "sample@user.com", full_name: "Sample User", password: "password")
    visit "/users/#{user.id}"

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  it "does not have admin access" do
    user =  User.create(email: "sample@user.com",
                        full_name: "Sample User",
                        password: "password",
                        role: 1)
    visit admin_categories_path
    expect(page).to have_content("The page you were looking for doesn't exist")

    visit admin_items_path
    expect(page).to have_content("The page you were looking for doesn't exist")

    visit admin_user_path(user)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
