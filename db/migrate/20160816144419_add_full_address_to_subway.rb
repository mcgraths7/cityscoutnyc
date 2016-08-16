class AddFullAddressToSubway < ActiveRecord::Migration[5.0]
  def change
    add_column :subways, :full_address, :string
  end
end
