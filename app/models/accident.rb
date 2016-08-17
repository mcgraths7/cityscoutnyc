class Accident < ApplicationRecord

  def filter_by_distance(user_input)
    latitudeUserInput = user_input.geocode[0]
    longitudeUserInput = user_input.geocode[1]
    Accident.where('(abs(accidents.latitude - ?) < 0.00001) AND (abs(accidents.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end

  def self.filter_by_district(lat_max, lat_min, long_max, long_min)
    Accident.where('accidents.latitude < ? AND accidents.latitude > ? AND accidents.longitude < ? AND accidents.longitude > ? ',lat_max, lat_min, long_max, long_min )
  end
end
