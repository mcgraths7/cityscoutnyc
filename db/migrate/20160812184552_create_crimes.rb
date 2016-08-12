class CreateCrimes < ActiveRecord::Migration[5.0]
  def change
    create_table :crimes do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
