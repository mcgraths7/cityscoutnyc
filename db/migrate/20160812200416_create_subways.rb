class CreateSubways < ActiveRecord::Migration[5.0]
  def change
    create_table :subways do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :lines
    end
  end
end
