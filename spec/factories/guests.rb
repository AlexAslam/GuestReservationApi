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

FactoryBot.define do
  factory :guest do
    name { "MyString" }
    email { "MyString@mystring" }
  end
end
