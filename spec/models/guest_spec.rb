# == Schema Information
#
# Table name: guests
#
#  id         :integer          not null, primary key
#  name       :string           default("")
#  email      :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Guest, type: :model do
	describe "Validation" do
		context "format of email" do
			let(:valid_attributes){
				attributes_for(:guest)
			}
			let(:invalid_attributes){
				attributes_for(:guest,email:"alex")
			}
			it "corrent format" do 
				guest = Guest.new(valid_attributes)
				expect(guest.valid?).not_to be_falsy
			end
			it "incorrent format" do 
				guest = Guest.new(invalid_attributes)
				expect(guest.valid?).to be_falsy
			end
		end
		context "presence of email and name" do 
			let(:empty_email_attributes){
				attributes_for(:guest,email:"")
			}
			let(:empty_email_attributes){
				attributes_for(:guest,name:"")
			}
			let(:empty_attributes){
				attributes_for(:guest)
			}
			let(:full_attributes){
				attributes_for(:guest)
			}
			it "absence of email" do 
				guest = Guest.new(empty_email_attributes)
				expect(guest.valid?).to be_falsy
			end
			it "absence of name" do 
				guest = Guest.new(empty_email_attributes)
				expect(guest.valid?).to be_falsy
			end
			it "absence of name and email" do 
				guest = Guest.new(empty_email_attributes)
				expect(guest.valid?).to be_falsy
			end
			it "presence of name and email" do 
				guest = Guest.new(full_attributes)
				expect(guest.valid?).not_to be_falsy
			end
		end
	end
end
