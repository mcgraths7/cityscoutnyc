Dir["db/data/ny_voting_districts.rb"].sort_by {|file| file[9]}.each{|file| load file }
