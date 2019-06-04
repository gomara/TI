require 'apiexample'
class SearchController < ApplicationController
    def search  
        if params[:search].blank?  
          return  
        else  
            @parameter = params[:search]
            s = Dog.new
            @data = s.search(@parameter)
    end
end  
end
