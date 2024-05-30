require "open-uri"
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
    user_name { "#{first_name.downcase}.#{last_name.downcase}" }  # Generate username

    after(:build) do |user|
      avatar_url = Faker::Avatar.image(slug: user.user_name, size: "50x50")
      user.avatar.attach(io: URI.parse(avatar_url).open, filename: "#{user.user_name}_avatar.jpg", content_type: 'image/jpg')
    end
  end
end
