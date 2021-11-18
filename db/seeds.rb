require "open-uri"
puts "cleaning DB..."
Booking.destroy_all
Desk.destroy_all
User.destroy_all


puts "creating users and desks"

# Seeds for Users and Desks

15.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    phone_number: Faker::PhoneNumber.phone_number,
    description: Faker::Lorem.sentence(word_count: 10)
  )
  user.photo.attach(io: file = URI.open("https://source.unsplash.com/featured/?face"), filename: "face", content_type: 'image/png')
  user.save!

  desk = Desk.new(
    title: Faker::Artist.name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(500..2000),
    user: user
  )
  desk.photo.attach(io: file = URI.open("https://source.unsplash.com/featured/?desk"), filename: "desk", content_type: 'image/png')
  desk.save!
end
