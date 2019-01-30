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
  has_paper_trail
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
    else
      if restaurant_shift.present?
        #  09:00:00 > 08:00:00 || 22:00:00 < 08:00:00
        if restaurant_shift.start_time > reservation_time || restaurant_shift.end_time < reservation_time
          self.errors.add(:base,"Reservation Time Should be in shift")
        end
      end
    end
  end
  after_create do 
    begin
      RestaurantMailer.to_guest(self).deliver!
      RestaurantMailer.to_restaurant(self).deliver!
    rescue
      puts "Email Issue"
    end
  end

  after_update do
    begin  
      RestaurantMailer.to_guest_update(self).deliver!
      RestaurantMailer.to_restaurant_update(self).deliver!
    rescue  
      puts 'Email Issue'
    end
  end
end
