require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.create(name: "Cheese") }

  it "is valid" do
    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category.name = nil

    expect(category).not_to be_valid
  end

  it "is invalid without a unique name" do
    category
    category2 = Category.create(name: "Cheese")

    expect(category2).not_to be_valid
  end
end
