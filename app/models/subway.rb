class Subway < ApplicationRecord

  def self.filter_by_district(lat_max, lat_min, long_max, long_min)
    Subway.where('subways.latitude < ? AND subways.latitude > ? AND subways.longitude < ? AND subways.longitude > ? ',lat_max, lat_min, long_max, long_min )
  end
end
