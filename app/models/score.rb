
class Score < ApplicationRecord

  def self.get_average_for(category)
    case category
      when :crime
        avg = VotingDistrict.median(:crime)/VotingDistrict.average_area

      when :accidents
        avg = VotingDistrict.median(:accidents)/VotingDistrict.average_area

      when :parks
        avg = VotingDistrict.all.compact.sum{ |vd| vd.parks}/VotingDistrict.all.length

      when :subways
        avg = VotingDistrict.all.compact.sum{ |vd| vd.subways}/VotingDistrict.all.length
      when :bikes
        avg = VotingDistrict.all.compact.sum{ |vd| vd.bikes}/VotingDistrict.all.length
      when :restaurants
        avg = VotingDistrict.all.compact.sum{ |vd| vd.restaurants}/VotingDistrict.all.length
      when :bars
        avg = VotingDistrict.all.compact.sum{ |vd| vd.bars}/VotingDistrict.all.length

      else
        return nil
    end
  end

  def self.averages
    {accidents: get_average_for(:accidents), bikes: get_average_for(:bikes),
     crime: get_average_for(:crime), parks: get_average_for(:parks), restaurants: get_average_for(:restaurants), 
     subways: get_average_for(:subways), bars: get_average_for(:bars)}
  end

  def self.score_for(category, district)
    averages = Score.averages
    district_categories = VotingDistrict.pluck(category).compact
    average = averages[category]
    variance = (district_categories.map { |a| (a - average)**2 }.reduce(:+))/(district_categories.length)
    stdev = variance ** (0.5)
    value = district[category]
    distance = (value/stdev)
    if distance > 5
      distance = 5
    elsif distance < 0
      distance = 0
    end
    if category == :crime || category == :accidents
      if value < average
        50 + distance * 10
      else
        50 - distance * 10
      end
    else
      if value < average
        50 - distance * 10
      else
        50 + distance * 10
      end
    end
  end

  def self.own_scores(district)
      scores = {
        accidents: score_for(:accidents, district),
        crime: score_for(:crime, district),
        bikes: score_for(:bikes, district),
        parks: score_for(:parks, district),
        restaurants: score_for(:restaurants, district),
        subways: score_for(:subways, district),
        bars: score_for(:bars, district)
      }
  end

end
