class Accident < ApplicationRecord
  def self.filter_by_district(lat_max, lat_min, long_max, long_min)
    Accident.where('accidents.latitude < ? AND accidents.latitude > ? AND accidents.longitude < ? AND accidents.longitude > ? ',lat_max, lat_min, long_max, long_min )
  end
end



