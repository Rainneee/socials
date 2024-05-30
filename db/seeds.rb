# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create 3 sample users
3.times do
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: Faker::Internet.unique.username,
    uid: nil,
    provider: nil
  )
  user.avatar.attach(io: URI.open(Faker::Avatar.image(slug: user.user_name, size: "50x50")), filename: "#{user.user_name}_avatar.jpg", content_type: 'image/jpg')
end

# Create sample posts
User.all.each do |user|
  rand(1..5).times do
    Tweet.create!(
      user: user,
      body: Faker::Lorem.paragraph(sentence_count: 5)
    )
  end
end