require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  it "can add items" do
    visit admin_items_path
    assert page.has_link?("add an item")
    click_link "add item"

    expect(current_path).to eq(new_admin_item_path)
    page.fill_in "title", with: "cornbread"
    page.fill_in "description", with: "yummy crumbly yellowy bready stuff"
    page.fill_in "price", with: 450
    click_button "add item"
    expect(current_path).to eq(admin_items_path)
    assert page.has_content?("cornbread")

  end

end
