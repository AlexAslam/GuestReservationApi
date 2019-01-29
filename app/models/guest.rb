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

class Guest < ApplicationRecord
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates_presence_of :name,:email
end
