class Citibike < ApplicationRecord

  def self.filter_by_district(lat_max, lat_min, long_max, long_min)
    Citibike.where('citibikes.latitude < ? AND citibikes.latitude > ? AND citibikes.longitude < ? AND citibikes.longitude > ? ',lat_max, lat_min, long_max, long_min )
  end
end
