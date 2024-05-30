require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = build(:user, password: nil)
    expect(user).to_not be_valid
  end

  it 'validates uniqueness of username (case insensitive)' do
    create(:user, user_name: 'JohnDoe')
    user = build(:user, user_name: 'johndoe')
    expect(user).to_not be_valid
    expect(user.errors[:user_name]).to include("has already been taken")
  end

  it "should have many tweets" do
    association = User.reflect_on_association(:tweets)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:dependent]).to eq(:destroy)
  end
end
