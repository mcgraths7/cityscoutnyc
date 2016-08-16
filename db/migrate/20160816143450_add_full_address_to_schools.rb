class AddFullAddressToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :full_address, :string
  end
end
