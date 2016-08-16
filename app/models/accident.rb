class Accident < ApplicationRecord

  def filter_by_distance(user_input)
    latitudeUserInput = user_input.geocode[0]
    longitudeUserInput = user_input.geocode[1]
    Accident.where('(abs(accidents.latitude - ?) < 0.00001) AND (abs(accidents.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end
end
