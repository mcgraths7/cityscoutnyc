class Citibike < ApplicationRecord

  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    Citibike.where('(abs(citibikes.latitude - ?) < 0.00001) AND (abs(citibikes.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end

  def self.filter_by_district(lat_max, lat_min, long_max, long_min)
    Citibike.where('citibikes.latitude < ? AND citibikes.latitude > ? AND citibikes.longitude < ? AND citibikes.longitude > ? ',lat_max, lat_min, long_max, long_min )
  end
end
