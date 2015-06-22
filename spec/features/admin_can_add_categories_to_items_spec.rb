require 'rails_helper'

describe "admin", type: :feature do

  before :each do
    @user = User.create(full_name:"Andrew Fink", email:"andrewfink@gmail.com", password:"password", role: 1)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    @item = Item.create(title: "fresh milk", description: "straight from the udder.", price: 5.00)
    @category = Category.create(name: "fruit")
    @category_item = CategoryItem.create(item_id:@item.id, category_id:@category.id)
  end

  xit "can add items to menu" do
    visit admin_items_path
    click_link "fresh milk"
    expect(current_path).to eq(admin_item_path(@item))
    click_link "add this item to a menu"
    expect(current_path).to eq(admin_category_items_path)
    assert page.has_content?("fresh milk")
    click_link "add this itme to the menu"
    expect(current_path).to eq(admin_categories_path)
    click_link "meat"
    expect(current_path).to eq(admin_category_path(@category))
    assert page.has_content?("fresh milk")
  end

end
