
require "pry"

# def self.filter_by_district(lat_max, lat_min, long_max, long_min)
#   Park.where('parks.latitude < ? AND parks.latitude > ? AND parks.longitude < ? AND parks.longitude > ? ',lat_max, lat_min, long_max, long_min )
# end

class VotingDistrict < ApplicationRecord

  def self.find_correct_district(lat, long)
    VotingDistrict.all.find_by('? < voting_districts.max_latitude AND ? > voting_districts.min_latitude AND ? < voting_districts.max_longitude AND ? > voting_districts.min_longitude', lat, lat, long, long)
  end

  def crime_in_district
    Crime.filter_by_district(max_latitude, min_latitude, max_longitude, min_longitude)
  end

  def bikes_in_district
    Citibike.filter_by_district(max_latitude, min_latitude, max_longitude, min_longitude)
  end

  def subways_in_district
    Subway.filter_by_district(max_latitude, min_latitude, max_longitude, min_longitude)
  end

  def schools_in_district
    School.filter_by_district(max_latitude, min_latitude, max_longitude, min_longitude)
  end

  def parks_in_district
    Park.filter_by_district(max_latitude, min_latitude, max_longitude, min_longitude)
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


  # def get_box
  #   boxes = []
  #   coords = COORDS.strip.gsub("\"MULTIPOLYGON ((", "").gsub("))\"", "").gsub(/\s\n/, "")
  #   coords = coords.split(/(\(|\))/).delete_if {|el| el.length < 50}
  #   coords = coords.map do |coord|
  #     new_coord = coord.split(/,?[\s\n]/).reject(&:empty?).map(&:to_f)
  #
  #     lats = new_coord.select { |c| c > 40}
  #     longs = new_coord.select { |c| c < -72}
  #     boxes << lats.select { |n| n == lats.max || n == lats.min} + longs.select { |n| n == longs.max || n == longs.min}
  #   end
  #   print boxes
  # end
end
