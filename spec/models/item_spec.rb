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

  it "responds with a collection of its categories" do
    expect(item).to respond_to(:categories)
  end

  it "responds with a collection of its orders" do
    expect(item).to respond_to(:orders)
  end

  it "responds with a collection of its order_items" do
    expect(item).to respond_to(:order_items)
  end

  it "can search the items by multiple terms" do
    Item.create(title: 'jerky', description: 'dry meat', price: 4.00)
    Item.create(title: 'berries', description: 'sweet fruit', price: 4.00)
    Item.create(title: 'corn', description: 'yellow and sweet', price: 4.00)

    expect(Item.search('jerk').map(&:title)).to eq(['jerky'])
    expect(Item.search('sweet').map(&:title)).to eq(['berries', 'corn'])
  end
end
