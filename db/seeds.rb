# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user2 = User.create(email:"Amanda@gmail.com", password:"1234563")

kit1 = Kitchen.new(name: "Joao's Kitchen", description:"Lovely Kitchen", street_address:"Ruazdo Embaxador nº3", city:"Lisbon", postal_code:"1400-253", country:"Portugal", capacity:5, price_per_hour:5)
kit2 = Kitchen.new(name: "Amanda's Kitchen", description:"Perfect Kitchen", street_address:"Rua das Asturias nº10", city:"S.Paulo", postal_code:"3253", country:"Brazil", capacity:10, price_per_hour:5)

kit2.user = user2

kit1.save
kit2.save
