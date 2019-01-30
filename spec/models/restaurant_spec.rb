# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint(8)        not null, primary key
#  name       :string           default("")
#  email      :string           default("")
#  phone      :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
	describe "Validation" do
		context "format validation of email and phone" do
			context "format of email" do
				let(:valid_email_attributes){
					attributes_for(:restaurant)
				}
				let(:invalid_email_attributes){
					attributes_for(:restaurant,email:"alex")
				}
				it "corrent email format" do 
					restaurant = Restaurant.new(valid_email_attributes)
					expect(restaurant.valid?).not_to be_falsy
				end
				it "incorrent email format" do 
					restaurant = Restaurant.new(invalid_email_attributes)
					expect(restaurant.valid?).to be_falsy
				end
			end
			context "format of phone" do
				let(:valid_phone_attributes){
					attributes_for(:restaurant)
				}
				let(:invalid_phone_attributes){
					attributes_for(:restaurant,phone:"142112312312dasda")
				}
				it "corrent phone format" do 
					restaurant = Restaurant.new(valid_phone_attributes)
					expect(restaurant.valid?).not_to be_falsy
				end
				it "incorrent phone format" do 
					restaurant = Restaurant.new(invalid_phone_attributes)
					expect(restaurant.valid?).to be_falsy
				end
			end
		end
		context "attributes presence" do 
			context "absence of email, name and phone" do 
				let(:empty_name_attributes){
					attributes_for(:restaurant,name:"")
				}
				let(:empty_email_attributes){
					attributes_for(:restaurant,email:"")
				}
				let(:empty_phone_attributes){
					attributes_for(:restaurant,phone:"")
				}
				let(:empty_name_email_phone_attributes){
					attributes_for(:restaurant,email:"",name:"",phone:"")
				}
				it "absence of email" do 
					restaurant = Restaurant.new(empty_email_attributes)
					expect(restaurant.valid?).to be_falsy
				end
				it "absence of name" do 
					restaurant = Restaurant.new(empty_name_attributes)
					expect(restaurant.valid?).to be_falsy
				end
				it "absence of phone" do 
					restaurant = Restaurant.new(empty_phone_attributes)
					expect(restaurant.valid?).to be_falsy
				end
				it "absence of name, email and phone" do 
					restaurant = Restaurant.new(empty_name_email_phone_attributes)
					expect(restaurant.valid?).to be_falsy
				end
			end
			context "presence of email, name and phone" do 
				let(:valid_attributes){
					attributes_for(:restaurant,name:"")
				}
				it "presence of all attributes" do 
					restaurant = Restaurant.new(valid_attributes)
					expect(restaurant.valid?).to be_falsy
				end
			end
		end
	end
end
