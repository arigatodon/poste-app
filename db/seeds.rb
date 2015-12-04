# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
posts = []

20.times do |p|
	posts << Post.create(
		title: Faker::Commerce.product_name,
		content: Faker::Lorem.paragraph(10, true, 10),
		remote_image_url: 'http://lorempixel.com/1200/800',
		phone: Faker::PhoneNumber.cell_phone,
		address: Faker::Address.street_address,
		latitude: Faker::Address.latitude,
		longitude: Faker::Address.longitude
		)
	
end