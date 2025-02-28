class ReservationsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @reservations.user = @user
    @reservations = Reservation.all
  end
end
