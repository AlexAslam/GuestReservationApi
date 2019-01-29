# == Schema Information
#
# Table name: restaurant_shifts
#
#  id            :integer          not null, primary key
#  shift_type    :string           default("")
#  start_time    :datetime         default(NULL)
#  end_time      :datetime         default(NULL)
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe RestaurantShift, type: :model do
	describe "Validation" do
		let(:restaurant){
			create(:restaurant)
		}
		context "Time Validation of start and end time" do 
			let(:valid_morning_timing_attributes){
				attributes_for(:morning_restaurant_shift,:restaurant=>restaurant)
			}
			let(:valid_evening_timing_attributes){
				attributes_for(:evening_restaurant_shift,:restaurant=>restaurant)
			}
			let(:invalid_morning_timing_attributes){
				attributes_for(:invalid_morning_restaurant_shift,:restaurant=>restaurant)
			}
			let(:invalid_evening_timing_attributes){
				attributes_for(:invalid_evening_restaurant_shift,:restaurant=>restaurant)
			}
			context "Corrent Time Validation" do 
				it "start time should not be less then end time" do
					restaurant_shift = RestaurantShift.create(valid_morning_timing_attributes)
					expect(restaurant_shift.valid?).not_to be_falsy
				end
				it "start time should not be less then end time" do
					restaurant_shift = RestaurantShift.create(valid_evening_timing_attributes)
					expect(restaurant_shift.valid?).not_to be_falsy
				end
			end
			context "Incorrent Time Validation" do 
				it "start time should not be less then end time" do
					restaurant_shift = RestaurantShift.create(invalid_morning_timing_attributes)
					expect(restaurant_shift.valid?).to be_falsy
				end
				it "start time should not be less then end time" do
					restaurant_shift = RestaurantShift.create(invalid_evening_timing_attributes)
					expect(restaurant_shift.valid?).to be_falsy
				end
			end
		end
		context "absense validatation of attributes" do 
			let(:empty_morning_timing_attributes){
				attributes_for(:empty_morning_restaurant_shift,:restaurant=>restaurant)
			}
			let(:empty_timing_attributes){
				attributes_for(:empty_evening_restaurant_shift,shift_type:"morning",:restaurant=>restaurant)
			}
			context "empty attributes" do 
				it "absense of shift_type start and end time" do
					restaurant_shift = RestaurantShift.create(empty_morning_timing_attributes)
					expect(restaurant_shift.valid?).to be_falsy
				end
				it "absense of start and end time" do
					restaurant_shift = RestaurantShift.create(empty_timing_attributes)
					expect(restaurant_shift.valid?).to be_falsy
				end
			end
		end
	end
end