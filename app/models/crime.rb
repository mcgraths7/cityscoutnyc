class Crime < ApplicationRecord


  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    Crime.where('(abs(crimes.latitude - ?) < 0.00001) AND (abs(crimes.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end

  def self.filter_by_district(lat_max, lat_min, long_max, long_min)
    Crime.where('crimes.longitude < ? AND crimes.longitude > ? AND crimes.latitude < ? AND crimes.latitude > ? ',lat_max, lat_min, long_max, long_min )
  end
end
