# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(0..49).each do |guest_temp|
	guest = Guest.new
	guest.name = Faker::Name.name
	guest.email = Faker::Internet.email
	if guest.save
		puts "guest #{guest_temp}"
	end
end

(0..49).each do |restaurant_temp|
	restaurant = Restaurant.new
	restaurant.name = Faker::Name.name
	restaurant.email = Faker::Internet.email
	restaurant.phone = Faker::PhoneNumber.phone_number
	if restaurant.save
		puts "restaurant #{restaurant_temp}"
		(0..49).each do |table_temp|
			restaurant_table = restaurant.restaurant_tables.new
			restaurant_table.name = Faker::Name.name
			restaurant_table.min_guest = Faker::Number.between(1,10)
			restaurant_table.max_guest = Faker::Number.between(1,10)
			if restaurant_table.save
				puts "restaurant_table #{table_temp}"
			end
		end
		[["moring","2019-01-01 09:00:00","2019-01-01 14:00:00"],["evening","2019-01-01 14:00:00","2019-01-01 22:00:00"]].each do |shift_temp|
			restaurant_shift = restaurant.restaurant_shifts.new
			restaurant_shift.shift_type = shift_temp.first
			restaurant_shift.start_time = shift_temp.second
			restaurant_shift.end_time = shift_temp.third
			if restaurant_shift.save
				puts "restaurant_shift #{restaurant_temp}"
			end
		end
	end
end
Restaurant.all.each do |restaurant|
	restaurant.restaurant_tables.all.each do |restaurant_table|
		restaurant.restaurant_shifts.each do |restaurant_shift|
			Guest.all.each do |guest|
				reservation = restaurant.reservations.new
				reservation.restaurant_table = restaurant_table
				reservation.restaurant_shift = restaurant_shift
				reservation.guest = guest
				reservation.reservation_time = "2019-01-01 11:29:33"
				reservation.guest_count = Faker::Number.between(1,10)
				if reservation.save
					puts "reservation => #{reservation.id}"
				end
			end
		end
	end
end
