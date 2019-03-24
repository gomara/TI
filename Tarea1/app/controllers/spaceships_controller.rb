require 'apiexample'
class SpaceshipsController < ApplicationController
  def index
    ship_id = params[:id]
    ship = Dog.new
    @data = ship.one_c_ship(ship_id)
  end
end
