class Score < ApplicationRecord

  def get_average(category)
    vals = VotingDistrict.all.pluck(category)
    vals.inject(0.0) {|result, num| result + num } / vals.size
  end

  def averages
    {total_score: 0, safety: get_average(:crime), education: get_average(:schools), transportation: (get_average(:bikes) + get_average(:accidents) + get_average(:subways)) / 3, recreation: get_average(:parks)}
  end
end

# t.integer "total_score"
# t.integer "safety_score"
# t.integer "education_score"
# t.integer "transportation_score"
# t.integer "recreation_score"
# t.integer "cost_of_living_score"
