require 'apiexample'
class PlanetsController < ApplicationController
  def index
    planet_id = params[:id]
    planet = Dog.new
    @data = planet.one_c_planet(planet_id)
  end
end
