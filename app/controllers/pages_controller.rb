class PagesController < ApplicationController
  def home
    @car = Car.where("brand LIKE ?", "Tesla").first
  end
end
