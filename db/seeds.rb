# Dir["db/data/accidentData.rb"].each {|file|  load file }
# Dir["db/data/citibikeData.rb"].each {|file|  load file }
# Dir["db/data/crimeData.rb"].each {|file|  load file }
# Dir["db/data/parkData.rb"].each {|file|  load file }
# Dir["db/data/restaurantData.rb"].each {|file|  load file }
# Dir["db/data/subwayData.rb"].each {|file|  load file }
# Dir["db/data/districtData.rb"].each {|file|  load file }
# Dir["db/data/barData.rb"].each {|file|  load file }
VotingDistrict.all.each do |vd|
    vd.update(bars: vd.within_walking_distance(Bar, 0.5))
end
