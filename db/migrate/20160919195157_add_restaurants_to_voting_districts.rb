class AddRestaurantsToVotingDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :voting_districts, :restaurants, :integer
  end
end
