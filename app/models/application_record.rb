require 'pry'
class ApplicationRecord < ActiveRecord::Base
  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude, :address => :full_address
  self.abstract_class = true

end
