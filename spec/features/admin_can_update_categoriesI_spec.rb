require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  it "can add categories" do
    visit admin_categories_path
    assert page.has_link?("add a menu")
    click_link "add a menu"

    expect(current_path).to eq(new_admin_category_path)
    page.fill_in "menu name", with: "nifty drinks"
    click_button "add menu"
    expect(current_path).to eq(admin_categories_path)
    assert page.has_content?("nifty drinks")

  end

end
