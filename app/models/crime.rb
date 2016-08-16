class Crime < ApplicationRecord


  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    Crime.where('(abs(crimes.latitude - ?) < 0.00001) AND (abs(crimes.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end
end
