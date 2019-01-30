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

FactoryBot.define do
  factory :restaurant do
    name { "MyString" }
    email { "MyString@MyString.com" }
    phone { "+232131231414" }
  end
end
