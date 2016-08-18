require 'pry'
class Score < ApplicationRecord

  def self.get_average(category)
    case category
      when :crime
        VotingDistrict.median(:crime)/VotingDistrict.average_area
      when :accidents
        VotingDistrict.median(:accidents)/VotingDistrict.average_area
      else
        VotingDistrict.median(:parks)/VotingDistrict.average_area
    end

  end

end



  #
  # #
  # #   vals = VotingDistrict.all.pluck(category).compact
  # #
  # #   vals.inject(0.0) {|result, num| result + num } / vals.size
  # # end
  #
  # def self.averages
  #   {safety: (get_average(:crime) +  get_average(:accidents)) / 2, education: get_average(:schools), transportation: (get_average(:bikes) + get_average(:subways)) / 2, recreation: get_average(:parks)}
  # end


