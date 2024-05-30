require 'rails_helper'

RSpec.describe Like, type: :model do
  it "should belong to user" do
    association = Like.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it "should belong to tweet" do
    association = Like.reflect_on_association(:tweet)
    expect(association.macro).to eq(:belongs_to)
  end
end
