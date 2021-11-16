puts "cleaning DB..."
User.destroy_all
Desk.destroy_all

puts "creating users..."

# Seeds for Users

50.times do
  user = User.new(
    first_name: Faker::Internet.first_name,
    last_name: Faker::Name.last_name
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    phone_number: Faker::PhoneNumber.phone_number
    description: Faker::Lorem.sentence,
  )
  user.save
end

puts "creating desks..."

# Seeds for

100.times do
  desk = Desk.new(
    title: Faker::FunnyName.title,
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price #=> 44.6
  )
  desk.save
end
