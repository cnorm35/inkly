# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do
	user = User.new
	user.email = Faker::Internet.email 
	user.name = Faker::Internet.user_name
	user.password = "password"
	user.password_confirmation = "password"
	user.save!
end
