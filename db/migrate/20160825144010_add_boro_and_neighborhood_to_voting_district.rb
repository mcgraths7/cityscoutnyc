class AddBoroAndNeighborhoodToVotingDistrict < ActiveRecord::Migration[5.0]
  def change
    add_column :voting_districts, :boro, :string
    add_column :voting_districts, :neighborhood, :string
  end
end
