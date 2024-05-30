FactoryBot.define do
  factory :tweet do
    association :user
    body { Faker::Lorem.sentence }
  end
end
