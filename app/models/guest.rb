# == Schema Information
#
# Table name: guests
#
#  id         :bigint(8)        not null, primary key
#  name       :string           default("")
#  email      :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Guest < ApplicationRecord
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates_presence_of :name,:email
	has_many :reservations, :dependent => :restrict_with_error
end
