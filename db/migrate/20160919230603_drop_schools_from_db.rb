class DropSchoolsFromDb < ActiveRecord::Migration[5.0]
  def change
    drop_table :schools
  end
end
