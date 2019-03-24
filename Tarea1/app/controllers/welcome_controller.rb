require 'apiexample'
class WelcomeController < ApplicationController

  def index
    dg = Dog.new
    #@a = dg.all_data_films
    @urll = "2"
    @b = "https://swapi.co/api/starships/2/"
    @ss = @b.split("/").last
    @all_films = dg.all_data_films

  
    
  end
end
