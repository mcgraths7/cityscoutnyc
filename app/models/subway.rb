class Subway < ApplicationRecord

  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    Subway.where('(abs(subways.latitude - ?) < 0.00001) AND (abs(subways.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end

  def self.filter_by_district(lat_max, lat_min, long_max, long_min)
    Subway.where('subways.latitude < ? AND subways.latitude > ? AND subways.longitude < ? AND subways.longitude > ? ',lat_max, lat_min, long_max, long_min )
  end
end
