# == Schema Information
#
# Table name: restaurant_tables
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  name          :string           default("")
#  min_guest     :integer          default(0)
#  max_guest     :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe RestaurantTable, type: :model do
	describe "Validation" do 
		let(:restaurant){create(:restaurant)}
		context "presence of attributes" do 
			let(:valid_attributes) {
				attributes_for(:restaurant_table,:restaurant=>restaurant)
			}
			it "restaurant min_guest max_guest" do
				restaurant_table = RestaurantTable.new(valid_attributes)
				expect(restaurant_table.valid?).not_to be_falsy
			end
		end
		context "absense of attributes" do  
			let(:empty_restaurant_table) {
				attributes_for(:empty_restaurant_table,:restaurant=>restaurant)
			}
			let(:empty_name_restaurant_table) {
				attributes_for(:empty_name_restaurant_table,:restaurant=>restaurant)
			}
			let(:empty_min_quest_restaurant_table) {
				attributes_for(:empty_min_quest_restaurant_table,:restaurant=>restaurant)
			}
			let(:empty_max_quest_restaurant_table) {
				attributes_for(:empty_max_quest_restaurant_table,:restaurant=>restaurant)
			}
			it "empty min guest for restaurant table" do
				restaurant_table = RestaurantTable.new(empty_min_quest_restaurant_table)
				expect(restaurant_table.valid?).to be_falsy
			end
			it "empty max guest for restaurant table" do
				restaurant_table = RestaurantTable.new(empty_max_quest_restaurant_table)
				expect(restaurant_table.valid?).to be_falsy
			end
			it "empty name for restaurant table" do
				restaurant_table = RestaurantTable.new(empty_name_restaurant_table)
				expect(restaurant_table.valid?).to be_falsy
			end
			it "empty record for restaurant table" do
				restaurant_table = RestaurantTable.new(empty_restaurant_table)
				expect(restaurant_table.valid?).to be_falsy
			end
		end
		context "min_guest and max_guest validation" do  
			let(:min_is_greater_then_max_restaurant_table) {
				attributes_for(:min_is_greater_then_max_restaurant_table,:restaurant=>restaurant)
			}
			let(:max_is_greater_then_min_restaurant_table) {
				attributes_for(:max_is_greater_then_min_restaurant_table,:restaurant=>restaurant)
			}
			let(:max_is_equal_to_min_restaurant_table) {
				attributes_for(:max_is_equal_to_min_restaurant_table,:restaurant=>restaurant)
			}
			it "min guest is greater then max restaurant table" do
				restaurant_table = RestaurantTable.new(min_is_greater_then_max_restaurant_table)
				expect(restaurant_table.valid?).to be_falsy
			end
			it "max guest is greater then min restaurant table" do
				restaurant_table = RestaurantTable.new(max_is_greater_then_min_restaurant_table)
				expect(restaurant_table.valid?).not_to be_falsy
			end
			it "min guest is equal to max guest restaurant table" do
				restaurant_table = RestaurantTable.new(max_is_equal_to_min_restaurant_table)
				expect(restaurant_table.valid?).not_to be_falsy
			end
		end
	end
end
