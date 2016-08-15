class Accident < ApplicationRecord
  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    Accident.where('(abs(accidents.latitude - ?) < 0.00001) AND (abs(accidents.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end
end
