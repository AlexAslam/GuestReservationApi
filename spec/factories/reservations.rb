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

FactoryBot.define do
  factory :reservation do
    restaurant { nil }
    restaurant_table { nil }
    restaurant_shift { nil }
    reservation_time { "2019-01-01 11:29:33" }
    guest { nil }
    guest_count { 1 }
  end
  factory :zero_guest_reservation,:class=>"Reservation" do
    restaurant { nil }
    restaurant_table { nil }
    restaurant_shift { nil }
    reservation_time { "2019-01-01 11:29:33" }
    guest { nil }
    guest_count { 0 }
  end
  factory :nil_time_reservation,:class=>"Reservation" do
    restaurant { nil }
    restaurant_table { nil }
    restaurant_shift { nil }
    reservation_time { nil }
    guest { nil }
    guest_count { 1 }
  end
  factory :empty_time_reservation,:class=>"Reservation" do
    restaurant { nil }
    restaurant_table { nil }
    restaurant_shift { nil }
    reservation_time { "" }
    guest { nil }
    guest_count { 1 }
  end
end
