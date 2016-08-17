class AddCityToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :city, :string
  end
end
