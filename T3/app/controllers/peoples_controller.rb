require 'apiexample'
class PeoplesController < ApplicationController
  def index
    people_id = params[:id]
    
    people = Dog.new
    #@data = people.one_c_people(people_id)
    @data = people.character(people_id)
 
    @films = @data['filmConnection']
    puts @films
    @ships = @data['starshipConnection']
    @planets = @data['homeworld'] 
  end
end
