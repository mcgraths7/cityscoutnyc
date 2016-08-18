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

  def self.percentile(category, district)
    cats = VotingDistrict.pluck(category).compact.sort
    l = cats.length
    groups = cats.group_by {|cat| cat}.map{|k, v| v}
    value = district[category]
    group = groups.find {|group| group.include?(value)}
    i = groups.index(group)
    if category === :crime || category == :accidents
      100 - (i.fdiv(groups.length - 1) * 100)
    elsif category == :schools
      school_percentile(district)
    else
      i.fdiv(groups.length - 1) * 100
    end
  end

  def self.school_percentile(district)
    scores = School.pluck(:score).compact.sort
    binding.pry
    district_score = district[:schools]
    scores.index(district_score).fdiv(scores.length-1) * 100
  end

  def self.crime_percentile

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
