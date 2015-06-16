require 'rails_helper'



describe "user login", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password")
    visit root_path
  end

  it "user can login" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "Email", with: "andrewfink@gmail.com"
    page.fill_in "Password", with: "password"
    click_button "come on in, farmhand"

    expect(current_path).to eq(root_path)
    assert page.has_content?("Farm to Table")
  end

  it "can't login without an email" do
    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "Password", with: "password"
    click_button "come on in, farmhand"

    expect(current_path).to eq(login_path)
  end

end
