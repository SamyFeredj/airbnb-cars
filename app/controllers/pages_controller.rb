class PagesController < ApplicationController
  def home
    @car = Car.where("brand LIKE ?", "Tesla")
  end
end
