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

class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :restaurant_table
  belongs_to :restaurant_shift
  belongs_to :guest
  validate do
  	if guest_count < 1
  		self.errors.add(:base,"Guest Count Cant be zero")
  	end
  	if reservation_time.nil?
  		self.errors.add(:base,"Reservation Time Cant be empty")
  	end
  end
end
