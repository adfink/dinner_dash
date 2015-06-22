require 'rails_helper'

describe "authorized user", type: :feature do

  it "does not have admin access" do
    user =  User.create(email: "sample@user.com",
                        full_name: "Sample User",
                        password: "password",)
    visit root_path

    click_link("login")
    fill_in "email", with: "sample@user.com"
    fill_in "password", with: "password"
    click_button("come on in, farmhand")
    expect(current_path).to eq(profile_path)

    visit admin_categories_path
    expect(page).to have_content("The page you were looking for doesn't exist")

    visit admin_items_path
    expect(page).to have_content("The page you were looking for doesn't exist")
    
    visit admin_user_path(user)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
