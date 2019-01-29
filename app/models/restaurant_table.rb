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

class RestaurantTable < ApplicationRecord
  belongs_to :restaurant
  validates_presence_of :name,:min_guest,:max_guest
  validate do 
  	if min_guest.present? && max_guest.present?
  		if min_guest > max_guest
  			self.errors.add(:base,"min guest should not be greater then max guest")
  		end
  	end
  end
end
