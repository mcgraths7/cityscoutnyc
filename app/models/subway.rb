class Subway < ApplicationRecord
  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    Subway.where('(abs(subways.latitude - ?) < 0.00001) AND (abs(subways.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end
end
