class CreatePark < ActiveRecord::Migration[5.0]
  def change
    create_table :parks do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
