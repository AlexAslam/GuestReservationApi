# == Schema Information
#
# Table name: reservations
#
#  id                  :bigint(8)        not null, primary key
#  restaurant_id       :bigint(8)
#  restaurant_table_id :bigint(8)
#  restaurant_shift_id :bigint(8)
#  guest_id            :bigint(8)
#  reservation_time    :datetime
#  guest_count         :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe Reservation, type: :model do
	describe "Validation" do 
	  let(:guest){create(:guest)}
	  let(:restaurant){create(:restaurant)}
	  let(:restaurant_table){create(:restaurant_table,restaurant:restaurant)}
	  let(:restaurant_shift){create(:morning_restaurant_shift,restaurant:restaurant)}
	  context "Create with full attributes" do
	  	let(:valid_attributes){attributes_for(:reservation,:guest=>guest,:restaurant=>restaurant,:restaurant_table=>restaurant_table,:restaurant_shift=>restaurant_shift)}
	  	it "gives complete attributes" do
			reservation = Reservation.new(valid_attributes)
			expect(reservation.valid?).not_to be_falsy
	  	end
	  end
	  context "invalid reservation" do
	  	let(:zero_guest_reservation){attributes_for(:zero_guest_reservation,:guest=>guest,:restaurant=>restaurant,:restaurant_table=>restaurant_table,:restaurant_shift=>restaurant_shift)}
	  	it "zero guest reservation" do
			reservation = Reservation.new(zero_guest_reservation)
			expect(reservation.valid?).to be_falsy
	  	end
	  	let(:nil_time_reservation){attributes_for(:nil_time_reservation,:guest=>guest,:restaurant=>restaurant,:restaurant_table=>restaurant_table,:restaurant_shift=>restaurant_shift)}
	  	it "Nil Time reservation" do
			reservation = Reservation.new(nil_time_reservation)
			expect(reservation.valid?).to be_falsy
	  	end
	  	let(:empty_time_reservation){attributes_for(:empty_time_reservation,:guest=>guest,:restaurant=>restaurant,:restaurant_table=>restaurant_table,:restaurant_shift=>restaurant_shift)}
	  	it "Empty Time Reservation" do
			reservation = Reservation.new(empty_time_reservation)
			expect(reservation.valid?).to be_falsy
	  	end
	  	let(:without_guest_reservation){attributes_for(:reservation,:restaurant=>restaurant,:restaurant_table=>restaurant_table,:restaurant_shift=>restaurant_shift)}
	  	it "Without Guest Reservation" do
			reservation = Reservation.new(without_guest_reservation)
			expect(reservation.valid?).to be_falsy
	  	end
	  	let(:without_restaurant_reservation){attributes_for(:reservation,:guest=>guest,:restaurant_table=>restaurant_table,:restaurant_shift=>restaurant_shift)}
	  	it "Without Restaurant Reservation" do
			reservation = Reservation.new(without_restaurant_reservation)
			expect(reservation.valid?).to be_falsy
	  	end
	  	let(:without_restaurant_table_reservation){attributes_for(:reservation,:guest=>guest,:restaurant=>restaurant,:restaurant_shift=>restaurant_shift)}
	  	it "Without Restaurant Table Reservation" do
			reservation = Reservation.new(without_restaurant_table_reservation)
			expect(reservation.valid?).to be_falsy
	  	end
	  	let(:without_restaurant_shift_reservation){attributes_for(:reservation,:guest=>guest,:restaurant=>restaurant,:restaurant_table=>restaurant_table)}
	  	it "Without Restaurant Shift Reservation" do
			reservation = Reservation.new(without_restaurant_table_reservation)
			expect(reservation.valid?).to be_falsy
	  	end
	  end
	end

	describe "reservation time should be in between shift time" do
		let(:guest){create(:guest)}
		let(:restaurant){create(:restaurant)}
		let(:restaurant_table){create(:restaurant_table,restaurant:restaurant)}
		let(:restaurant_shift){create(:morning_restaurant_shift,restaurant:restaurant)}
		context "Valid Reservation Time" do
			let(:valid_time_reservation){attributes_for(:reservation,guest:guest,restaurant:restaurant,restaurant_table:restaurant_table,restaurant_shift:restaurant_shift)}
			it "given valid time" do
				reservation = Reservation.new(valid_time_reservation)
				expect(reservation.valid?).not_to be_falsy
			end
		end
		context "Invalid Reservation Time" do
			let(:lesser_time_reservation){attributes_for(:reservation,:reservation_time=>"2019-01-01 08:00:00",guest:guest,restaurant:restaurant,restaurant_table:restaurant_table,restaurant_shift:restaurant_shift)}
			it "given lesser time" do
				reservation = Reservation.new(lesser_time_reservation)
				expect(reservation.valid?).to be_falsy
			end
			let(:greater_time_reservation){attributes_for(:reservation,:reservation_time=>"2019-01-01 24:00:00",guest:guest,restaurant:restaurant,restaurant_table:restaurant_table,restaurant_shift:restaurant_shift)}
			it "given lesser time" do
				reservation = Reservation.new(lesser_time_reservation)
				expect(reservation.valid?).to be_falsy
			end
		end
	end
end