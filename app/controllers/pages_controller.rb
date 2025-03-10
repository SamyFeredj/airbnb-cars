class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @car = Car.where("brand LIKE ?", "Tesla").first
  end
end
