require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
    visit login_path
    fill_in('email', with: "andrewfink@gmail.com")
    fill_in('password', with: "password")
    click_button('come on in, farmhand')
    visit edit_admin_user_path(@user)
  end

  it "can edit its user properties" do
    expect(page).to have_button("update profile")
  end

  it "can update its full name" do
    fill_in('full name', with: 'Douglas Froman')
    click_button('update profile')

    expect(current_path).to eq(admin_user_path(@user))
    expect(page).to have_content('Douglas Froman')
    expect(page).not_to have_content('Andrew Fink')
  end

  it "can update its email" do
    fill_in('email', with: 'bobby@bob.com')
    click_button('update profile')
    user = User.find_by(id: @user.id)

    expect(current_path).to eq(admin_user_path(@user))
    expect(user.email).to eq('bobby@bob.com')
  end
end

