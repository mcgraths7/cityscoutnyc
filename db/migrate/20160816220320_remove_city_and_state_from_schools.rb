class RemoveCityAndStateFromSchools < ActiveRecord::Migration[5.0]
  def change
    remove_column :schools, :city, :string
    remove_column :schools, :state, :string
  end
end
