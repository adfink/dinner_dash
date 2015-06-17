require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
  end

  it "can edit categories" do
    visit admin_user_path(@user)

    expect(current_path).to eq(admin_user_path(@user))
    assert page.has_content?("admin")
    assert page.has_content?("categories")
    first('category').click_link "edit"

    expect(current_path).to eq(edit_admin_category_path)
    page.fill_in "name", with: "other tasty things"
    click_button "update this category"
    expect(current_path).to eq(admin_user_path(@user))
    assert page.has_content?("other tasty things")
    refute page.has_content?("nifty drinks")

  end

end
