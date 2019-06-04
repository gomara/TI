require 'apiexample'
class WelcomeController < ApplicationController

  def index
    dg = Dog.new
    #@a = dg.all_data_films
  
    @all_f = dg.all_films


  
    
  end
end
