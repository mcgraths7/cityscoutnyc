require 'pry'
module Api
  module V1
    class VotingDistrictsController < ApplicationController
        def index
          point = UserPoint.create(voting_districts_params)
          district = VotingDistrict.find_correct_district(point.geocode[0], point.geocode[1])
          render json: {
            own_score: Score.own_scores(district),
            averages: {
              :accidents=>160.55194245292316,
              :bikes=>5,
              :crime=>321.1038849058463,
              :parks=>57, :restaurants=>53,
              :subways=>4
            },
            attributes: district.attributes,
            boro: district.boro,
            neighborhood: district.neighborhood
          }
        end

        private
          def voting_districts_params
            params.permit(:full_address)
          end
    end
  end
end
