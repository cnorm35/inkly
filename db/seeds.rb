5.times do
	user = User.new
	user.email = Faker::Internet.email 
	user.name = Faker::Internet.user_name
	user.password = "password"
	user.password_confirmation = "password"
	user.save!
end

Artist.create(
	shop_name: "Inkwell",
	street_address: "123 Fake St.",
	city: "Philadelphia",
	state: "PA",
	zip_code: 19143,
	user_attributes: {
		email: "user@example.com",
		name: "Codez",
		password: "password"
		}
	)
