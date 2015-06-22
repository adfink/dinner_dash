require 'rails_helper'

describe "user", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password")
    visit root_path
  end

  it "can login" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "email", with: "andrewfink@gmail.com"
    page.fill_in "password", with: "password"
    click_button "come on in, farmhand"

    expect(current_path).to eq(profile_path)
    assert page.has_content?("Andrew Fink")
  end

  it "can't login without an email" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "password", with: "password"
    click_button "come on in, farmhand"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login")
  end

  it "can't login without a password" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "email", with: "andrewfink@gmail.com"
    click_button "come on in, farmhand"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid login")
  end

  it "can logout while logged in" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "email", with: "andrewfink@gmail.com"
    page.fill_in "password", with: "password"
    click_button "come on in, farmhand"

    click_link("logout")
    expect(current_path).to eq(root_path)
    expect(page).to have_content("See you again soon!")
  end

end
