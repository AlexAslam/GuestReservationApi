class RestaurantMailer < ApplicationMailer
  default from: 'restaurant@some.com'
  # RestaurantMailer.to_guest(Reservation.last).deliver!
  def to_guest(reservation)
  	@reservation = reservation
    mail(to: @reservation.guest.email, subject: 'Welcome to My Awesome Site')
  end
  # RestaurantMailer.to_restaurant(Reservation.last).deliver!
  def to_restaurant(reservation)
  	@reservation = reservation
    mail(to: @reservation.restaurant.email, subject: 'Welcome to My Awesome Site')
  end
  # RestaurantMailer.to_guest(Reservation.last).deliver!
  def to_guest_update(reservation)
    @reservation = reservation
    mail(to: @reservation.guest.email, subject: 'Welcome to My Awesome Site')
  end
  # RestaurantMailer.to_restaurant(Reservation.last).deliver!
  def to_restaurant_update(reservation)
    @reservation = reservation
    mail(to: @reservation.restaurant.email, subject: 'Welcome to My Awesome Site')
  end
end
