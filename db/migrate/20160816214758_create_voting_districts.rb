class CreateVotingDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :voting_districts do |t|
      t.float :max_latitude
      t.float :min_latitude
      t.float :max_longitude
      t.float :min_longitude
      t.integer :crime
      t.integer :schools
      t.integer :parks
      t.integer :subways
      t.integer :bikes
      t.integer :accidents
    end
  end
end
