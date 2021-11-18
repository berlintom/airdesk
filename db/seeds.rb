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
  user.save

  desk = Desk.new(
    title: Faker::Artist.name,
    address: [
      "Yorckstraße 89, 10965 Berlin",
      "Bernburger Str. 35, 10963 Berlin",
      "Wilhelmstraße 22, 10963 Berlin",
      "Knaackstraße 16-18, 10405 Berlin",
      "Straßburger Str. 33, 10405 Berlin",
      "Knaackstraße 37, 10435 Berlin",
      "Akazienstraße 9, 10823 Berlin",
      "Eisenacher Str. 75, 10823 Berlin",
      "Schloßstraße 60, 14059 Berlin",
      "Wielandstraße 38, 10629 Berlin",
      "Fuldastraße 33, 12045 Berlin",
      "Lenaustraße 10, 12047 Berlin",
      "Albrechtstraße 13, 10117 Berlin",
      "Unter den Linden 35, 10117 Berlin"
    ].sample,
    description: Faker::Quote.matz,
    long_description: Faker::Restaurant.review,
    price: rand(500..2000),
    user: user
  )
  desk.photo.attach(io: file = URI.open("https://source.unsplash.com/featured/?desk"), filename: "desk", content_type: 'image/png')
  desk.save
end
