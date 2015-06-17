require 'rails_helper'

describe "admin", type: :feature do

    before :each do
      @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
      visit root_path
    end

    it "can login" do
      click_link("login")
      expect(current_path).to eq(login_path)
      page.fill_in "email", with: "andrewfink@gmail.com"
      page.fill_in "password", with: "password"
      click_button "come on in, farmhand"

      expect(current_path).to eq(admin_user_path(@user))
      assert page.has_content?("admin")
    end

end
