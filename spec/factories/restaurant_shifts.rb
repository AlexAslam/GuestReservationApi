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

FactoryBot.define do
  factory :empty_morning_restaurant_shift, class: "RestaurantShift" do
    shift_type { "" }
    start_time { "" }
    end_time { "" }
    restaurant { nil }
  end

  factory :empty_evening_restaurant_shift, class: "RestaurantShift" do
    shift_type { "" }
    start_time { "" }
    end_time { "" }
    restaurant { nil }
  end
  factory :morning_restaurant_shift, class: "RestaurantShift" do
    shift_type { "morning" }
    start_time { "2019-01-29 09:00:00" }
    end_time { "2019-01-29 14:00:00" }
    restaurant { nil }
  end

  factory :evening_restaurant_shift, class: "RestaurantShift" do
    shift_type { "morning" }
    start_time { "2019-01-29 14:00:00" }
    end_time { "2019-01-29 22:00:00" }
    restaurant { nil }
  end
  factory :invalid_morning_restaurant_shift, class: "RestaurantShift" do
    shift_type { "morning" }
    start_time { "2019-01-29 14:00:00" }
    end_time { "2019-01-29 09:00:00" }
    restaurant { nil }
  end

  factory :invalid_evening_restaurant_shift, class: "RestaurantShift" do
    shift_type { "morning" }
    start_time { "2019-01-29 22:00:00" }
    end_time { "2019-01-29 14:00:00" }
    restaurant { nil }
  end
end
