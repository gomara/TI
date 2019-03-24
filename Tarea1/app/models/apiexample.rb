class Dog
    include HTTParty
    base_uri "swapi.co/api"
    # Devuelve toda la data de cada todas las peliculas
    def all_data_films
        response = self.class.get('/films', :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        res = results['results']
        #results[:olj] = "uu"
        return res
        #results.each do |result|
         #   puts "Title: #{result['title']}"
        #end
    end


     #devuelve los nombres de naves con su id
    def films_names(result)
        names = []
        if  result.has_key?("films")
            result["films"].each do |char|
                id = char.split("/").last
                n = self.one_film(id)["title"]
                h = {:name => n,:id=> id}
                names << h
            end  
        end
        return names
        
    end
    #devuelve los nombres con su id
    def people_names(result)
        names = []
        if  result.has_key?("characters")
            result["characters"].each do |char|
                id = char.split("/").last
                n = self.one_people(id)["name"]
                h = {:name => n,:id=> id}
                names << h
            end 

        elsif  result.has_key?("pilots")
                result["pilots"].each do |char|
                id = char.split("/").last
                n = self.one_people(id)["name"]
                h = {:name => n,:id=> id}
                names << h
            end
            
        
        elsif  result.has_key?("residents")
            result["residents"].each do |char|
            id = char.split("/").last
            n = self.one_people(id)["name"]
            h = {:name => n,:id=> id}
            names << h
        end
    
        end
        return names
        
    end

    #devuelve los nombres de planetas con su id
    def planets_names(result)
        names = []
        if  result.has_key?("planets")
            result["planets"].each do |char|
                id = char.split("/").last
                n = self.one_planet(id)["name"]
                h = {:name => n,:id=> id}
                names << h
            end 
            
        elsif result.has_key?("homeworld")
               id = result["homeworld"].split("/").last
                n = self.one_planet(id)["name"]
                h = {:name => n,:id=> id}
                names << h
        end

        return names
        
    end

    #devuelve los nombres de naves con su id
    def ships_names(result)
        names = []
        if  result.has_key?("starships")
            result["starships"].each do |char|
                id = char.split("/").last
                n = self.one_ship(id)["name"]
                h = {:name => n,:id=> id}
                names << h
            end  
        end
        return names
        
    end





    #devulve info para mostrar todo de uno solo (agrega nombres de cada cosa con su id)
    def one_c_film(film_id)
        response = self.class.get('/films/'+film_id, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        pe_names = people_names(results)
        pl_names = planets_names(results)
        sh_names = ships_names(results)

        results[:people_names] = pe_names
        results[:planets_names] = pl_names
        results[:ships_names] = sh_names
       

        return results
    end

    def one_c_people(people_id)
        response = self.class.get('/people/'+people_id, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        
        pl_names = planets_names(results)
        fl_names = films_names(results)
        sh_names = ships_names(results)
        
        results[:planets_names] = pl_names
        results[:films_names] = fl_names
        results[:ships_names] = sh_names
       

        return results
    end

    def one_c_ship(ship_id)
        response = self.class.get('/starships/'+ship_id, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        
       
        fl_names = films_names(results)
        pe_names = people_names(results)
        
        results[:films_names] = fl_names
        results[:people_names] = pe_names
       

        return results
    end

    def one_c_planet(planet_id)
        response = self.class.get('/planets/'+planet_id, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response

        fl_names = films_names(results)
        pe_names = people_names(results)
        
        results[:films_names] = fl_names
        results[:people_names] = pe_names
       

        return results
    end




## info basica de cada cosa
    def one_film(film_id)
        response = self.class.get('/films/'+film_id, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        return results
    end

    def one_people(people_id)
        response = self.class.get('/people/'+people_id, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        return results
    end

    def one_planet(planet_id)
        response = self.class.get('/planets/'+planet_id, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        return results
    end

    def one_ship(ship_id)
        response = self.class.get('/starships/'+ship_id, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        return results
    end


##buscar
    def search_peoples(tag)
        response = self.class.get('/people/?search='+tag, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        return results
    end
    def search_films(tag)
        response = self.class.get('/films/?search='+tag, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        return results
    end
    def search_planets(tag)
        response = self.class.get('/planets/?search='+tag, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        return results
    end
    def search_ships(tag)
        response = self.class.get('/starships/?search='+tag, :headers =>{'Content-Type' => 'application/json'})
        results = response.parsed_response
        return results
    end

    def search(tag)
        has = {}
        n_films = []
        n_peoples = []
        n_ships = []
        n_planets = []

        films = search_films(tag)
        peoples = search_peoples(tag)
        ships = search_ships(tag)
        planets = search_planets(tag)


        if !films['results'].empty?
            films['results'].each do |film|
                n = film['title']
                id = film['url'].split("/").last
                h = {:name => n,:id=> id}
                n_films << h
            end 
        end

        if !peoples['results'].empty?
            peoples['results'].each do |people|
                n = people['name']
                id = people['url'].split("/").last
                h = {:name => n,:id=> id}
                n_peoples<< h
            end 
        end
        if !planets['results'].empty?
            planets['results'].each do |planet|
                n = planet['name']
                id = planet['url'].split("/").last
                h = {:name => n,:id=> id}
                n_planets << h
            end 
        end
        if !ships['results'].empty?
            ships['results'].each do |ship|
                n = ship['name']
                id = ship['url'].split("/").last
                h = {:name => n,:id=> id}
                n_ships<< h
            end 
        end
        has[:s_films] = n_films
        has[:s_peoples] = n_peoples
        has[:s_planets] = n_planets
        has[:s_ships] = n_ships
        return has
    end
   
  
 end
 
  
 