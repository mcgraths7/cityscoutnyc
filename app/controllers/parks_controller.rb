class ParksController < ApplicationController
  def index
    @parks = Park.all
    render json: @parks
  end

  def show

  end
end
