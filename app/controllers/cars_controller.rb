class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    if @car.save
      redirect_to @car, notice: "Voiture ajoutée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    if @car.destroy
      redirect_to cars_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def mycars
    @cars = Car.where(user_id: current_user.id)
  end

  private

  def car_params
    params.require(:car).permit(:brand, :car_model, :car_location, :rent_price, :kilometers, :release_year, :photo)
  end
end
