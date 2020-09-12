class UserPoint < ApplicationRecord
  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude, :address => :full_address
  after_validation :geocode
end
