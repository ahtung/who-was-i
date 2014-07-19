class AncestorsController < ApplicationController
  def search
    ancestor = { name: params[:ancestor][:name], born_on: params[:ancestor][:birthday], died_on: nil}
    @ancestors = find_ancestor(ancestor)
    respond_to do |format|
      format.js
    end
  end
  
  private
  
    def find_ancestor(offspring)
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
