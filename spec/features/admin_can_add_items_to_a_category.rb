require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    @category = Category.create(name: "meat")
  end

  it "can add items to menu" do
    visit admin_categories_path
    click_link "meat"
    expect(current_path).to eq(admin_category_path(@category))
    click_link "add itme to this menu"
    expect(current_path).to eq(new_admin_category_item_path(@category))

  end

end
