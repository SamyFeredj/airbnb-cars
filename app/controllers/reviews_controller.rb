class ReviewsController < ApplicationController
  before_action :set_reservation, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.reservation = @reservation
    if @review.save
      redirect_to reservation_path(@reservation)
    else
      redirect_to reservation_path(@reservation)
      # render "reservations/show", status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
