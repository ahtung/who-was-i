class AncestorsController < ApplicationController
  def search
    @ancestors = [{name: 'Anton'}, {name: 'James'}]
    respond_to do |format|
      format.js
    end
  end
end
