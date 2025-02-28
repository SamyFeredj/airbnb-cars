class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.select { |reservation| reservation.user_id == current_user.id }
  end

  def mycars
    @reservations = Reservation.where(car_id: Car.where(user_id: current_user.id).map { |car| car.id })
  end
end
