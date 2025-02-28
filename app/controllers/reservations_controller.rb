class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.select { |reservation| reservation.user_id == current_user.id }
  end

  def mycars
    @reservations = Reservation.all.select { |reservation| reservation.user_id == current_user.id  && reservation.car_id == current_user.cars[:id] }
    raise
  end
end
