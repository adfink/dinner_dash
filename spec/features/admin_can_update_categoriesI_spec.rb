require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
  end

  it "can add categories" do
    visit admin_user_path(@user)

    expect(current_path).to eq(admin_user_path(@user))
    assert page.has_content?("admin")
    assert page.has_content?("categories")
    click_link "add a category"

    expect(current_path).to eq(new_admin_category_path)
    page.fill_in "name", with: "nifty drinks"
    click_button "add this category"
    expect(current_path).to eq(admin_user_path(@user))
    assert page.has_content?("nifty drinks")

  end

end
