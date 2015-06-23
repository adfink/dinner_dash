require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    @item = Item.create(title: "chicken-leg", description: "yum", price: 40000)
  end

  it "can navigate to items index" do
    visit admin_user_path(@user)

    expect(current_path).to eq(admin_user_path(@user))
    assert page.has_content?("admin")
    assert page.has_link?("items")
    click_link("items")

    expect(current_path).to eq(admin_items_path)
  end

  it "can change the status of an item from active to retired" do
    visit admin_items_path
    assert page.has_content?("active")
    assert page.has_content?("retire")
    choose "retire"
    expect(current_path).to eq(admin_items_path)
    click_button "update this item's status"
    expect(current_path).to eq(admin_items_path)
  end

end
