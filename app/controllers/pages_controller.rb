class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @products = current_user.products
    @bookings = current_user.bookings
    @favourites = current_user.favourites
  end
end
