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
UserWeight.destroy_all
User.destroy_all

users = [
  {name: "Batman", email: 'batman@themakersquare.com', goal: 180, profile_pic: 'https://s3.amazonaws.com/mks_learn_app/batman.jpg'},
  {name: "Catwoman", email: 'catwoman@themakersquare.com', goal: 120, profile_pic: 'https://s3.amazonaws.com/mks_learn_app/catwoman.jpg'}
]

users.each do |user|
  User.create(
    name: user[:name],
    email: user[:email],
    goal: user[:goal],
    password: 'password',
    pic: user[:pic]
  )
end

weightin = [{date: "Sunday", weight: 200, pic: 'http://jolidon.com/wp-content/uploads/2012/06/Jolidon-basic-Men4.jpg'},{date: "Monday", weight: 190, pic: 'http://thenypost.files.wordpress.com/2013/10/x-men_-the-last-stand.jpg'},{date: "Tuesday", weight: 180, pic: 'http://jolidon.com/wp-content/uploads/2012/06/Jolidon-basic-Men6.jpg'}]

weightin.each do |hash|
  Weight.create(
    date: hash[:date],
    weight: hash[:weight],
    pic: hash[:pic],
    user_id: User.first.id + rand(0..1)
  )
end

comments = [{comment: "wow!"},{comment: "you are fat!"},{comment: "those abs!"}]

Weight.all.each do |weight|
  comments.each do |comment|
    Comment.create(
      comment: comment[:comment],
      user_id: User.first.id + rand(0..1)
    )
  end
end

