class Point < ApplicationRecord
  def get_lat_long
    self.update(latitude: self.geocode[0], longitude: self.geocode[1])
  end
end
