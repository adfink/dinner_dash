require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    @category = Category.create(name: "meat")
  end

  it "can navigate to menus index" do
    visit admin_user_path(@user)

    expect(current_path).to eq(admin_user_path(@user))
    assert page.has_content?("admin")
    assert page.has_link?("menus")
    click_link("menus")

    expect(current_path).to eq(admin_categories_path)
  end

  it "can edit a menu" do
    visit admin_categories_path
    click_link "edit"
    expect(current_path).to eq(edit_admin_category_path(@category))
    page.fill_in "name", with: "other tasty things"
    click_button "update this menu"
    expect(current_path).to eq(admin_categories_path)
    assert page.has_content?("other tasty things")
    refute page.has_content?("meat")

  end

end
