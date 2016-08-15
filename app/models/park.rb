class Park < ApplicationRecord
  def find_by_latitude_longitude(latitudeUserInput, longitudeUserInput)
    # Need to convert to ActiveRecord query
    SELECT name, address, ( 6371 * acos( cos( radians(latitudeUserInput) ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians(longitudeUserInput) ) + sin( radians(latitudeUserInput) ) * sin( radians( latitude ) ) ) ) AS distance FROM your_table_here HAVING distance <= 2 ORDER BY distance;
  end

  def find_by_name(park_name)
    self.where('name = ?', park_name)
  end

end
