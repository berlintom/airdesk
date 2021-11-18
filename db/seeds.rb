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
    long_description: [
      "Ahoy! gets its nautically-themed name because it helps ‘budding startups and freelancers steer clear of potential pitfalls’. The 4,500 sqm coworking space was founded in 2012 by Nikita Roshkow and Nikolas Woischnik, of blog TechBerlin. ",
      "This Desk is awesome! The colossal start-up campus counts the likes of Soundcloud, Twitter, Uber and Pinterest among its core tenants. But it’s not all about the big names: this diverse coworking space markets itself as a ‘next-generation business club’ that caters for companies big and small.",
      "Our polished environs cater for freelancers as well as big businesses. (Rumour has it, Apple is quietly working on its self-driving car project from within its Freidrichstraße address.)",
      "Founded in 2005, this Desk was an early mover and shaker on Berlin’s coworking scene, commandeering the upper level of its Rosenthaler Platz coffee house as flexible ‘plug and play’ workspace.",
      "Welcome to this awesome Desk with nice views. Perks include a coffee package which lets you caffeinate to your heart’s content and super fast VDSL broadband connection for an additional bolt-on fee.",
      "This activist-led Desk space is pretty intimate, with only 20 members, all of whom are part of a ‘circle economy’ that aims to design out waste and promote wider social benefits. Furnishings, fixtures and partitions are all made from upcycled items, which gives the Neukölln space a DIY feel.",
      "This collective Berlin Desk space is geared towards makers, providing them with workshops, desk space, and even a photography studio. The building’s voluminous main hall is shared by artists and designers. ",
      "If ever there’s a city gunning for London’s title of the ‘creative capital of Europe’, it’s Berlin. The German capital is home to large communities of artists, designers, and programmers attracted to the city’s cheaper rents and its cache of old industrial buildings, ripe for adaptive reuse.",
      "We call it the Desk House Berlin – a hub for freelancers and visitors to the city – while others are becoming dedicated factories for experimentation.",
      "DreamDesk - Berlin is not your typical Desk space. It is inspired by easy movement desktop computers that aren’t fixed to the tables, and members are encouraged to be active. The freewheeling style of the building includes workspaces and conference rooms.",
      "Equipped with the latest technology, this desk space gives start-ups, freelancers, and established businesses a place for socializing, creativity, and productiveness. Apart from high-speed internet and unlimited coffee, it offers amenities like mobile workstations, lockers, a kitchen, 3D printer, and literally everything else to seize the day. Leisure activities such as yoga, theater with sofas, and various sports courses to maintain a work-life balance.",
      "Besides over 300+ Flex desks in both locations, other amenities include private offices, event spaces, a spacious backyard (Neukölln), a lovely rooftop (Kreuzberg), and more!",
      "Women Desk! CoWomen is a vibrant and inspiring shared Desk community meant for ambitious women who aim to bring a change in the working world. Located in the heart of Berlin, 5 min walk from public transit.",
      "If you are someone who goes solo and is on a budget, this one is for you. You can be social or live in your own desk space. Space is divided into three zones, namely, social, focus, and silent. You can switch between them at any time."
    ].sample,
    price: rand(500..2000),
    user: user
  )
  desk.photo.attach(io: file = URI.open("https://source.unsplash.com/featured/?desk"), filename: "desk", content_type: 'image/png')
  desk.save!
end
