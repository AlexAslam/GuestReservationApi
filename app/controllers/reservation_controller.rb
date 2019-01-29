class ReservationController < ApplicationController
	# The table for reservation, 
	# the restaurant shift in which you want the reservation, reservation time -- 
	# reservation time must lie within restaurant shift start time and end time, 
	# guest who made the reservation, guest count for the reservation -- 
	# the guest count must be between maximum and minimum capacity of the table selected for reservation -
	def create

	end

	private 
	def reservation_params
 		params.require(:reservation).permit(:reservation_time,:guest_name,:guest_count)
	end
end
