class Score < ApplicationRecord

  def self.get_average(category)
    vals = VotingDistrict.all.pluck(category)
    vals.inject(0.0) {|result, num| result + num } / vals.size
  end

  def self.averages
    {safety: (get_average(:crime) +  get_average(:accidents)) / 2, education: get_average(:schools), transportation: (get_average(:bikes) + get_average(:subways)) / 2, recreation: get_average(:parks)}
  end
end

# t.integer "total_score"
# t.integer "safety_score"
# t.integer "education_score"
# t.integer "transportation_score"
# t.integer "recreation_score"
# t.integer "cost_of_living_score"
