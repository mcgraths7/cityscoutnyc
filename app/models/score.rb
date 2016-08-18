require 'pry'
class Score < ApplicationRecord

  def self.get_average(category)
    case category
      when :crime
        avg = VotingDistrict.median(:crime)/VotingDistrict.average_area

      when :accidents
        avg = VotingDistrict.median(:accidents)/VotingDistrict.average_area

      when :parks
        # avg = VotingDistrict.median(:parks)/VotingDistrict.average_area
        avg = VotingDistrict.all.sum{ |vd| vd.parks}/VotingDistrict.all.length

      when :subways
        avg = VotingDistrict.all.sum{ |vd| vd.subways}/VotingDistrict.all.length
      when :bikes
        avg = VotingDistrict.all.sum{ |vd| vd.bikes}/VotingDistrict.all.length
      when :schools
        avg = VotingDistrict.median(:schools)

      else
        return "blah blah blah"
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


