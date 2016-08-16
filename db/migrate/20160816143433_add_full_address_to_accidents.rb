class AddFullAddressToAccidents < ActiveRecord::Migration[5.0]
  def change
    add_column :accidents, :full_address, :string
  end
end
