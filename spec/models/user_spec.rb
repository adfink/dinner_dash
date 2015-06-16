require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: "test@email.com", password: "password", full_name: "Betty White") }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user.email = nil

    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user.password = nil

    expect(user).not_to be_valid
  end

  it "is invalid wihtout a unique email" do
    user
    user2 = User.create(email: "test@email.com", password: "pass", full_name: "Betty Black")

    expect(user2).not_to be_valid
  end
end
