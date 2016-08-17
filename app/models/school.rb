class School < ApplicationRecord
  after_validation :geocode_school

  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    School.where('(abs(schools.latitude - ?) < 0.00001) AND (abs(schools.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end

  def geocode_school
    self.update(latitude: self.geocode[0], longitude: self.geocode[1])
  end
end
