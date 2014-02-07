# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Comment.destroy_all
Friendship.destroy_all
Weight.destroy_all
User.destroy_all



User.create!([
  {name: "Austin Powers", email: "austin@powers.com", password:"password", goal: 190, height_feet: "6", height_in: "4" },
  {name: "Dr Evil", email: "dr@evil.com", password:"password", goal: 190, height_feet: "6", height_in: "9" },
  {name: "Vanessa Kensington", email: "Venessa@kensington.com", password:"password", goal: 190, height_feet: "5", height_in: "11" },
  {name: "Fook Me", email: "Fook@me.com", password:"password", goal: 190, height_feet: "5", height_in: "4" }
])

