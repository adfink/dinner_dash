require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    @item = Item.create(title: "chicken-leg", description: "yum", price: 40000)
    @item.categories.create(name: 'test menu')
  end

  it "can navigate to items index" do
    visit admin_user_path(@user)

    expect(current_path).to eq(admin_user_path(@user))
    assert page.has_content?("admin")
    assert page.has_link?("items")
    click_link("items")

    expect(current_path).to eq(admin_items_path)
  end

  it "can add items" do
    visit admin_items_path
    assert page.has_link?("add an item")
    click_link "add an item"

    expect(current_path).to eq(new_admin_item_path)
    page.fill_in "title", with: "cornbread"
    page.fill_in "description", with: "yummy crumbly yellowy bready stuff"
    page.fill_in "price", with: 450
    check("2")
    click_button "add item"
    expect(current_path).to eq(admin_items_path)
    assert page.has_content?("cornbread")

  end

  it "can edit an item" do
    visit admin_items_path
    click_link "edit"
    expect(current_path).to eq(edit_admin_item_path(@item))
    page.fill_in "title", with: "big t-bone steak"
    click_button "update this item"
    expect(current_path).to eq(admin_items_path)
    assert page.has_content?("big t-bone steak")
    refute page.has_content?("meat")
  end

end
