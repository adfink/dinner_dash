require 'rails_helper'

describe "user creates account", type: :feature do
  it "user can create account" do
    visit root_path
    click_link("new farmhand")
    page.fill_in "email", with: "andrewfink@gmail.com"
    page.fill_in "confirm email", with: "andrewfink@gmail.com"
    page.fill_in "password", with: "password"
    page.fill_in "confirm password", with: "password"
    page.fill_in "nickname", with: "Finker"
    page.fill_in "full name", with: "Andrew Fink"
    click_button("join the farm")

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("Finker")
  end

  it "user can't create account without all required fields" do
    visit root_path
    click_link("new farmhand")
    page.fill_in "password", with: "password"
    page.fill_in "nickname", with: "Finker"
    page.fill_in "full name", with: "Andrew Fink"
    click_button("join the farm")
    expect(current_path).to eq(new_user_path)
    expect(page).to_not have_content("Finker")
  end



end
