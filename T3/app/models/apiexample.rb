class Dog
    include HTTParty

    def all_films()
        url ="https://swapi-graphql-integracion-t3.herokuapp.com/"
        
        response = self.class.post(url,
            headers: { 
                'Content-Type'  => 'application/json'},
            body:{
                query: "query {
                    allFilms{
                      films{
                        id
                        releaseDate
                        title
                        episodeID
                        director
                        producers
                      }
                    }
                  }"
                  
            }.to_json)
        results = response.parsed_response
        data = results['data']
        all = data['allFilms']
        return all
    end

    def film(id)
        url ="https://swapi-graphql-integracion-t3.herokuapp.com/"
        
        response = self.class.post(url,
            headers: { 
                'Content-Type'  => 'application/json'},
            body:{
                query: "query {
                    film(id: \""+id.to_s+"\") 
                    {
                      title
                      openingCrawl
                      director
                      producers
                      episodeID
                      releaseDate
                      characterConnection{
                        characters{
                          id
                          name
                        }
                      }
                      starshipConnection{
                        starships{
                          id
                          name
                        }
                      }
                      planetConnection{
                        planets{
                          id
                          name
                        }
                      }
                    }
                  }"
                  
            }.to_json)
        results = response.parsed_response
        data = results['data']
    
        f = data['film']
        return f
    end

    def character(id)
        url ="https://swapi-graphql-integracion-t3.herokuapp.com/"
        
        response = self.class.post(url,
            headers: { 
                'Content-Type'  => 'application/json'},
            body:{
                query: "query { person(id: \""+id.to_s+"\")
                {
                  name
                  skinColor
                  height
                  hairColor
                  mass
                  eyeColor
                  birthYear
                  gender
                  
                  filmConnection{
                    films{
                      title
                      id
              
                    }
                  }
                  starshipConnection{
                    starships{
                      name
                      id
                    }
                  }
                  homeworld{
                    name
                    id
                  }
                }
                  }"
                  
            }.to_json)
        results = response.parsed_response
        data = results['data']
        pe = data['person']
      
        return pe
    end

    def ship(id)
        url ="https://swapi-graphql-integracion-t3.herokuapp.com/"
        
        response = self.class.post(url,
            headers: { 
                'Content-Type'  => 'application/json'},
            body:{
                query: "query {starship(id: \""+id.to_s+"\")
                {
                  name
                  length
                  model
                  manufacturers
                  costInCredits
                  maxAtmospheringSpeed
                  crew
                  passengers
                  cargoCapacity
                  consumables
                  hyperdriveRating
                  MGLT
                  starshipClass
                  
                  filmConnection{
                    films
                    {
                      id
                      title
                    }
                  }
                  pilotConnection{
                    pilots
                    {
                      name
                      id
                    }
                  }
                }
                  }"
            }.to_json)
        results = response.parsed_response
        data = results['data']
    
        star = data['starship']
        return star
    end

    def planet(id)
        url ="https://swapi-graphql-integracion-t3.herokuapp.com/"
        
        response = self.class.post(url,
            headers: { 
                'Content-Type'  => 'application/json'},
            body:{
                query: "query {planet(id: \""+id.to_s+"\")
                {
                  name
                  terrains
                  gravity
                  surfaceWater
                  diameter
                  climates
                  population
                  orbitalPeriod
                  rotationPeriod
                  
                  residentConnection{
                    residents
                    {
                      id
                      name
                    }
                  }
                  filmConnection{
                    films{
                      id
                      title
                    }
                  }
                }

                  }"
                  
            }.to_json)
        results = response.parsed_response
        data = results['data']
    
        pl = data['planet']
        return pl
    end
end

