class CrimesController < ApplicationController
  def index
      render json: Crime.all.length
  end
end
