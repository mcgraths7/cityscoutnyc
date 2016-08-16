class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :total_score
      t.integer :safety_score
      t.integer :education_score
      t.integer :transportation_score
      t.integer :recreation_score
      t.integer :cost_of_living_score

      t.timestamps
    end
  end
end
