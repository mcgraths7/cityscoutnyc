class Crime < ApplicationRecord

  def self.filter_by_district(lat_max, lat_min, long_max, long_min)
    Crime.where('crimes.latitude < ? AND crimes.latitude > ? AND crimes.longitude < ? AND crimes.longitude > ? ',lat_max, lat_min, long_max, long_min )
  end
end
