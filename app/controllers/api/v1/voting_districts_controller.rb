module Api
  module V1
    class VotingDistrictsController < ApplicationController
        def index

          point = UserPoint.create({full_address: CGI.unescape(voting_districts_params[:full_address])})
          district = VotingDistrict.find_correct_district(point.latitude, point.longitude).first
          render json: {
            own_score: Score.own_scores(district),
            averages: Score.averages,
            attributes: district.attributes,
            boro: district.boro,
            neighborhood: district.neighborhood
          }
        end

        private
          def voting_districts_params
            params.permit(:full_address, :voting_district)
          end
    end
  end
end
