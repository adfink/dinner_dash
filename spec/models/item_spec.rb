require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.create(title: "bacon", description: "salty", price: 500) }

  it "is valid" do
    expect(item).to be_valid
  end

  it "is invalid without a title" do
    item.title = nil

    expect(item).not_to be_valid
  end

  it "is invalid if the title is an empty string" do
    item.title = ""

    expect(item).not_to be_valid
  end

  it "is invalid without a description" do
    item.description = nil

    expect(item).not_to be_valid
  end

  it "is invalid if the description is an empty string" do
    item.description = ""

    expect(item).not_to be_valid
  end

  it "is invalid without a price" do
    item.price = nil
    expect(item).not_to be_valid
  end

  it "is invalid without a unique title" do
    item
    item2 = Item.create(title: "bacon", description: "so good", price: 300)

    expect(item2).not_to be_valid
  end

  it "is invalid if the price is less than 0" do
    item.price = -100

    expect(item).not_to be_valid
  end

  it "can be assigned a picture but has a default value" do
    item2 = Item.create(title: "bacon", description: "so good", price: 300,
                        photo_url:"http://jnafarm.locallygrown.net/files/grower/image/5860/original/Farm_to_Table.jpg")

    expect(item.photo_url).to eq("http://cornucopia.org/cereal-scorecard/images/profiles/farm_to_table_logo.jpg")
    expect(item2.photo_url).to eq("http://jnafarm.locallygrown.net/files/grower/image/5860/original/Farm_to_Table.jpg")
  end
end
