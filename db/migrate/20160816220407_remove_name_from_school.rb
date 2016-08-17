class RemoveNameFromSchool < ActiveRecord::Migration[5.0]
  def change
    remove_column :schools, :name, :string
  end
end
