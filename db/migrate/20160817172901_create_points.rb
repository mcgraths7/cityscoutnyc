class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.string :full_address
      t.float :latitude
      t.float :longitude
    end
  end
end
