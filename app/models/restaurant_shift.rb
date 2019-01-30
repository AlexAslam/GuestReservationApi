# == Schema Information
#
# Table name: restaurant_shifts
#
#  id            :bigint(8)        not null, primary key
#  shift_type    :string           default("")
#  start_time    :datetime
#  end_time      :datetime
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RestaurantShift < ApplicationRecord
  belongs_to :restaurant
  validates_presence_of :shift_type, :start_time, :end_time
  validate do 
  	if start_time.present? and end_time.present?
	  	if start_time > end_time
	        self.errors.add(:base, "Shift end time can’t be less than the start time")
	  	end
	end
  end
end
