class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @products = current_user.products
    @bookings = current_user.bookings
    @requests = []
    current_user.products.each do |product|
      product.bookings.each do |booking|
        @requests.push(booking)
      end
    end
    @favourites = current_user.favourites
  end

  def messages
    @chatrooms = Chatroom.where(p1_id: current_user.id) + Chatroom.where(p2_id: current_user.id)
  end
end
