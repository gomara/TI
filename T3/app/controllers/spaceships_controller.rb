require 'apiexample'
class SpaceshipsController < ApplicationController
  def index
    ship_id = params[:id]
    ship = Dog.new
    #@data = ship.one_c_ship(ship_id)
    @data = ship.ship(ship_id)
    @films = @data["filmConnection"]
    @pilots = @data['pilotConnection']
  end
end
