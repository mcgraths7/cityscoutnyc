class AddFullAddressToParks < ActiveRecord::Migration[5.0]
  def change
    add_column :parks, :full_address, :string
  end
end
