class VotingDistrictsController < ApplicationController
  def index
    point = Point.create(full_address: params[:address])
    point.get_lat_long
    district = VotingDistrict.find_correct_district(point.latitude, point.longitude)
    render json: district.own_scores
  end

  private
    def voting_districts_params
      params.permit(:address)
    end
end
