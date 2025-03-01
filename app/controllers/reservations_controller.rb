class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.select { |reservation| reservation.user_id == current_user.id }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.car_id = params[:car_id]
    @reservation.user_id = current_user.id
    @reservation.total_price = (@reservation.end_date - @reservation.start_date + 1) * @reservation.car.rent_price
    @reservation.status = "Pending"
    if @reservation.save!
      redirect_to reservations_path
    else
      redirect_to car_path(Car.find(@reservation.car_id))
    end
  end

  def mycars
    @reservations = Reservation.where(car_id: Car.where(user_id: current_user.id).map { |car| car.id })
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price, :status, :car_id, :user_id)
  end
end
