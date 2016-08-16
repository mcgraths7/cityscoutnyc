class ParksController < ApplicationController
  def index
    @parks = Park.all.length
    render json: @parks
  end
end
