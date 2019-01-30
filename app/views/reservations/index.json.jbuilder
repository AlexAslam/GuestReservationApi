json.reservations @reservations.each do |reservation|
	json.reservation_time reservation.reservation_time
	json.guest_count reservation.guest_count
	json.guest_name reservation.guest.name
	json.table_name reservation.restaurant_table.name
end