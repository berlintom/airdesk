puts "cleaning DB..."
Desk.destroy_all
User.destroy_all


puts "creating users and desks"

# Seeds for Users and Desks

50.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    phone_number: Faker::PhoneNumber.phone_number,
    description: Faker::Lorem.sentence(word_count: 10)
  )
  user.save

  desk = Desk.new(
    title: Faker::Artist.name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(500..2000),
    user: user
  )
  desk.save
end
