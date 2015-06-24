equire 'rails_helper'

describe "user", type: :feature do

  before :each do
    visit root_path
  end

  it "can search for items" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "email", with: "andrewfink@gmail.com"
    page.fill_in "password", with: "password"
    click_button "come on in, farmhand"

    expect(current_path).to eq(profile_path)
    assert page.has_content?("Andrew Fink")
  end


