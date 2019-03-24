require 'apiexample'
class PeoplesController < ApplicationController
  def index
    people_id = params[:id]
    people = Dog.new
    @data = people.one_c_people(people_id)
  end
end
