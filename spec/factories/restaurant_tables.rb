# == Schema Information
#
# Table name: restaurant_tables
#
#  id            :bigint(8)        not null, primary key
#  restaurant_id :integer
#  name          :string           default("")
#  min_guest     :integer          default(0)
#  max_guest     :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :restaurant_table do
    restaurant { nil }
    name { "MyString" }
    min_guest { 1 }
    max_guest { 1 }
  end

  factory :empty_name_restaurant_table,:class=>"RestaurantTable" do
    restaurant { nil }
    name { "" }
    min_guest { 1 }
    max_guest { 1 }
  end

  factory :empty_min_quest_restaurant_table,:class=>"RestaurantTable" do
    restaurant { nil }
    name { "string" }
    min_guest { }
    max_guest { 1 }
  end

  factory :empty_max_quest_restaurant_table,:class=>"RestaurantTable" do
    restaurant { nil }
    name { "string" }
    min_guest { 1 }
    max_guest { }
  end

  factory :empty_restaurant_table,:class=>"RestaurantTable" do
    restaurant { nil }
    name { "" }
    min_guest {  }
    max_guest {  }
  end

  factory :min_is_greater_then_max_restaurant_table,:class=>"RestaurantTable" do
    restaurant { nil }
    name { "toor" }
    min_guest { 2 }
    max_guest { 1 }
  end

  factory :max_is_greater_then_min_restaurant_table,:class=>"RestaurantTable" do
    restaurant { nil }
    name { "toor" }
    min_guest { 1 }
    max_guest { 2 }
  end

  factory :max_is_equal_to_min_restaurant_table,:class=>"RestaurantTable" do
    restaurant { nil }
    name { "toor" }
    min_guest { 1 }
    max_guest { 1 }
  end
end
