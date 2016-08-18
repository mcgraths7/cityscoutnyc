
require "pry"

# def self.filter_by_district(lat_max, lat_min, long_max, long_min)
#   Park.where('parks.latitude < ? AND parks.latitude > ? AND parks.longitude < ? AND parks.longitude > ? ',lat_max, lat_min, long_max, long_min )
# end

class VotingDistrict < ApplicationRecord

  def self.find_correct_district(lat, long)
    VotingDistrict.all.find_by('? < voting_districts.max_latitude AND ? > voting_districts.min_latitude AND ? < voting_districts.max_longitude AND ? > voting_districts.min_longitude', lat, lat, long, long)
  end

  def self.average_area
    VotingDistrict.all.sum{|vd| vd.own_area }/(VotingDistrict.all.length)
  end

  def self.median(category)
    cats = VotingDistrict.all.pluck(category).sort
    length = cats.length
    (cats[(length-1) / 2] + cats[length / 2] / 2.0)
  end

  def own_area
    h = distance(max_latitude, max_longitude, min_latitude, max_longitude)
    w = distance(min_latitude, min_longitude, max_latitude, min_longitude)
    h*w
  end

  def own_center
    lat_center = (max_latitude + min_latitude) / 2
    long_center = (max_longitude + min_longitude) / 2
    center = [lat_center,long_center]
  end

  def distance(lat1, lon1, lat2, lon2)
    p = Math::PI/180
    a = 0.5 - Math.cos((lat2 - lat1) * p)/2 +
        Math.cos(lat1 * p) * Math.cos(lat2 * p) *
            (1 - Math.cos((lon2 - lon1) * p))/2

    return 7917.5117 * Math.asin(Math.sqrt(a))
  end

  def closest_school_score
    schools = School.all.map do |school|
      distance = distance(school.latitude,school.longitude,own_center[0], own_center[1])
    end.sort
    return School.find{ |school| !school.nil?}.score

  end

  def subs_within_walking_distance
    subways = Subway.all.select do |subway|
      distance(subway.latitude, subway.longitude, own_center[0], own_center[1]) < 0.75
    end.length
  end

  def bikes_within_walking_distance
    bikes = Citibike.all.select do |bike|
      distance(bike.latitude, bike.longitude, own_center[0], own_center[1]) < 0.75
    end.length
  end

  def parks_within_walking_distance
    parks = Park.all.select do |park|
      distance(park.latitude, park.longitude, own_center[0], own_center[1]) < 1.25
    end.length
  end

  def crime_in_district
    Crime.filter_by_district(max_latitude, min_latitude, max_longitude, min_longitude)
  end

  def accidents_in_district
    Accident.filter_by_district(max_latitude, min_latitude, max_longitude, min_longitude)
  end

  def own_scores
      scores = {safety: (self.crime + self.accidents) / 2,
        education: self.schools,
        transportation: (self.bikes + self.subways) / 2,
        recreation: self.parks
      }
      averages = Score.averages
      own_scores = scores.each_with_object({}) do |(key, fn), own_scores|
        own_scores[key] = fn.fdiv(averages[key])
      end
  end

end
