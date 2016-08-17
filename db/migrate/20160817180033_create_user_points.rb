class CreateUserPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :user_points do |t|
      t.string :full_address
      t.float :latitude
      t.float :longitude
    end
  end
end
