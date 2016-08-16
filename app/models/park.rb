class Park < ApplicationRecord

  geocoded_by :address => :full_address
  reverse_geocoded_by :latitude, :longitude, :address => :full_address

  def full_address
    [street, city, state, country].compact.join(', ')
  end

  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    Park.where('(abs(parks.latitude - ?) < 0.00001) AND (abs(parks.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
    #-----------------------------------------------------------
    # SELECT name, address, ( 6371 * acos( cos( radians(latitudeUserInput) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians(longitudeUserInput) ) + sin( radians(latitudeUserInput) ) * sin( radians( latitude ) ) ) ) AS distance FROM your_table_here HAVING distance <= 2 ORDER BY distance;
  end


end
