
require "pry"

class VotingDistrict < ApplicationRecord
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
