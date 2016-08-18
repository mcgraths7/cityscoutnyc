module Api
  module V1
    class VotingDistrictsController < ApplicationController
        def index
          point = UserPoint.create(voting_districts_params)
          district = VotingDistrict.find_correct_district(point.geocode[0], point.geocode[1])
          render json: district.own_scores
        end

        private
          def voting_districts_params
            params.permit(:full_address)
          end
    end
  end
end
