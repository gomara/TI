require 'apiexample'
class FilmsController < ApplicationController
  def index
    film_id = params[:id]
    fil = Dog.new
    @data = fil.film(film_id)
    @characters = @data['characterConnection']
    @ships = @data['starshipConnection']
    @planets = @data['planetConnection']

    #@data = fil.one_c_film(film_id)
    #@names = fil.people_names(@data)

  end
end
