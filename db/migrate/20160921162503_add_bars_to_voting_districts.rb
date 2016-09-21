class AddBarsToVotingDistricts < ActiveRecord::Migration[5.0]
  def change
    add_column :voting_districts, :bars, :integer
  end
end
