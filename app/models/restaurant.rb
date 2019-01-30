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

class Restaurant < ApplicationRecord
	
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :phone, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/ }
	validates_presence_of :name,:email,:phone
	
	has_many :restaurant_shifts, :dependent => :restrict_with_error
	has_many :restaurant_tables, :dependent => :restrict_with_error
	has_many :reservations, :dependent => :restrict_with_error
	has_many :guests,through: :reservations
end
