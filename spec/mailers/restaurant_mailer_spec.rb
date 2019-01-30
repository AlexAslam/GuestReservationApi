require "rails_helper"

RSpec.describe RestaurantMailer, type: :mailer do
  let(:guest){create(:guest)}
  let(:restaurant){create(:restaurant)}
  let(:restaurant_table){create(:restaurant_table,restaurant:restaurant)}
  let(:restaurant_shift){create(:morning_restaurant_shift,restaurant:restaurant)}
  let(:reservation) { create(:reservation,:guest=>guest,:restaurant=>restaurant,:restaurant_table=>restaurant_table,:restaurant_shift=>restaurant_shift) }
   describe "to guest" do
    let(:to_guest) { RestaurantMailer.to_guest(reservation) }

    it "renders the headers" do
      expect(to_guest.subject).to eq("Welcome to My Awesome Site")
      expect(to_guest.to).to eq(["#{reservation.guest.email}"])
      expect(to_guest.from).to eq(["restaurant@some.com"])
    end
  end

   describe "to_restaurant" do
    let(:to_restaurant) { RestaurantMailer.to_restaurant(reservation) }

    it "renders the headers" do
      expect(to_restaurant.subject).to eq("Welcome to My Awesome Site")
      expect(to_restaurant.to).to eq(["#{reservation.restaurant.email}"])
      expect(to_restaurant.from).to eq(["restaurant@some.com"])
    end
  end
end