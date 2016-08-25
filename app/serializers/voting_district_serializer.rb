class VotingDistrictSerializer < ActiveModel::Serializer
  attributes :own_scores, :neighborhood, :boro
end
