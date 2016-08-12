class CreateCrime < ActiveRecord::Migration[5.0]
  def change
    create_table :crimes do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
