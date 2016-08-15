class Citibike < ApplicationRecord
  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    Citibike.where('(abs(citibikes.latitude - ?) < 0.00001) AND (abs(citibikes.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end
end
