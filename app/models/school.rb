class School < ApplicationRecord
  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    School.where('(abs(schools.latitude - ?) < 0.00001) AND (abs(schools.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end
end
