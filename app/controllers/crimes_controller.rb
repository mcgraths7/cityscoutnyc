class CrimesController < ApplicationController
  def index
      render json: Crime.all
  end
end
