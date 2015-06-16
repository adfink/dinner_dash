require 'rails_helper'



describe "user login", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password")
  end

  it "user can login" do
    visit root_path

    click_link("login")
    expect(current_path).to eq(login_path)
    page.fill_in "Email", with: "andrewfink@gmail.com"
    page.fill_in "Password", with: "password"
    click_button "come on in, farmhand"

    expect(current_path).to eq(root_path)
    assert page.has_content?("Farm to Table")

  end

end
