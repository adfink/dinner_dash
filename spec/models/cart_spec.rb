require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.new(nil) }

  it "initializes with an empty contents hash" do
    expect(cart.contents).to eq({}) 
  end

  it "can add item ids to itself" do
    cart.add_item(4)
    expect(cart.contents).to eq('4' => 1)
  end

  it "can return the total number if items it holds" do
    cart.add_item(1)
    cart.add_item(2)
    cart.add_item(1)

    expect(cart.total).to eq(3)
  end

  it "can clear its contents" do
    cart.add_item(1)
    cart.add_item(2)
    cart.add_item(1)

    expect(cart.contents).to eq('1' => 2, '2' => 1)
    cart.clear

    expect(cart.contents).to eq({})
  end
end
