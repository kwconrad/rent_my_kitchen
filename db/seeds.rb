# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Just so you know this is gonna take a bit of time, alright?"
puts "here we go"
puts "----------------------"

puts "clearing database..."
User.destroy_all



puts "Creating random users..."
names = []

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  email = first_name.downcase + "@" + last_name.downcase + ".com"
  password = Faker::Number.number(6)

  user = User.new(email: email, password: password)
  user.save!

  street_address = Faker::Address.street_address
  city = Faker::Address.city
  country = Faker::Address.country
  postal_code = Faker::Address.postcode

  user_attributes = {
    first_name: first_name,
    last_name: last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: street_address + ", " + city + ", " + country,
    dob: Faker::Date.birthday(18, 65).to_s,
  }

  user_account = UserAccount.create(user_attributes)
  user_account.remote_photo_url = "https://unsplash.it/200/300/?random"
  user_account.user = user

  user_account.save!

  puts ""
  puts "created user #{first_name} #{last_name}!"
  puts "now creating a kitchen for #{first_name}..."

  kitchen_attributes = {
    name: "#{first_name}'s kitchen",
    street_address: street_address,
    city: city,
    postal_code: postal_code,
    country: country,
    description: BetterLorem.w(10, true),
    capacity: rand(1..6),
    price_per_hour: rand(1..5) * 10 + rand(1..9)
  }

  kitchen = Kitchen.new(kitchen_attributes)
  kitchen.user = user
  kitchen.remote_photo_url = "https://unsplash.it/600/600/?random"
  kitchen.save!

  puts "created #{kitchen.name}!"
end

puts "done!"
