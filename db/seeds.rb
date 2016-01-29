# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
end

100.times do
  Contact.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, number: Faker::Number.number(10), user_id: rand(1..11))
end

1000.times do
  Message.create(user_id: rand(1..11), contact_id: rand(1..102), message: Faker::Lorem.sentence)
end

# Resource.create(name: "Yo Mamma", link: "http://api.yomomma.info/", access: "joke['joke']")
# Resource.create(name: "Chuck Norris", link: "http://api.icndb.com/jokes/random?exclude=Array", access: "joke['value']['joke']")

User.create(first_name: "Jupiter", last_name: "Baudot", email: "", password: "test1234")
# User.create(first_name: "", last_name: "", email: "", password: "")
Contact.create(first_name: "Imraan", last_name: "Ismail", number: "", user_id: 11)
