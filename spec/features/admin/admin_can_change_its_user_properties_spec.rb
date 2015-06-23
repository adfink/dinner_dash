require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
  end

  it "can edit its user properties" do
    visit edit_admin_user_path(@user)

    expect(page).to have_button("update profile")
  end

end

