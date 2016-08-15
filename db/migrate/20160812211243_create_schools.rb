class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :district
      t.float :score

      t.timestamps
    end
  end
end
