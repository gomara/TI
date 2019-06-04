require 'apiexample'
class PlanetsController < ApplicationController
  def index
    planet_id = params[:id]
    planet = Dog.new
    #@data = planet.one_c_planet(planet_id)
    @data = planet.planet(planet_id)
    @residents = @data['residentConnection']
    @films = @data['filmConnection'] 
  end
end
