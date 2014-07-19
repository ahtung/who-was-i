class AncestorsController < ApplicationController
  def search
    name = 'Dunya Kirkali'
    born_on = Date.new(1984, 5, 11)
    
    @ancestors = [{ name: name, born_on: born_on.to_s, died_on: nil}]
    @ancestors = find_ancestor
    respond_to do |format|
      format.js
    end
  end
  
  private
  
    def find_ancestor
      offspring = @ancestors.last
      puts "\t#find_ancestor for ".green + offspring.to_s.blue
  
      query = [{
        :"*" => nil,
        date_of_death: offspring[:born_on].to_s,
        :"/people/person/place_of_birth" => nil,
        :"/people/person/date_of_birth" => nil,
        type: "/people/deceased_person",
        limit: 10
      }]
      people = FreebaseAPI.session.mqlread(query)
      return people
    end
end
