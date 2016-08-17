class Score < ApplicationRecord

  def average(category)
    vals = VotingDistrict.all.pluck(category)
    vals.inject(0.0) {|result, num| result + num } / vals.size
  end
end
