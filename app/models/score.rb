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

  def self.averages
    {accidents: get_average(:accidents), bikes: get_average(:bikes), crime: get_average(:crime), parks: get_average(:parks), schools: get_average(:schools), subways: get_average(:subways)}
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

    district_score = district[:schools]
    closest_school_score = scores.find {|score| (district_score - score).abs < 0.2}
    scores.index(closest_school_score).fdiv(scores.length-1) * 100
  end

  def self.own_scores(district)
      scores = {accidents: percentile(:accidents, district),
        crime: percentile(:crime, district),
        bikes: percentile(:bikes, district),
        parks: percentile(:parks, district),
        schools: percentile(:schools, district),
        subways: percentile(:subways, district)
      }
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
