class School < ApplicationRecord
  after_validation :geocode_school

  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    School.where('(abs(schools.latitude - ?) < 0.00001) AND (abs(schools.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end
  def self.filter_by_district(lat_max, lat_min, long_max, long_min)
    School.where('schools.latitude < ? AND schools.latitude > ? AND schools.longitude < ? AND schools.longitude > ? ',lat_max, lat_min, long_max, long_min )
  end
  def geocode_school
    self.update(latitude: self.geocode[0], longitude: self.geocode[1])
  end
end
