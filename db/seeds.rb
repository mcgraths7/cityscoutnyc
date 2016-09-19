Dir["db/data/restaurants.rb"].sort_by {|file| file[9]}.each{|file| load file }
