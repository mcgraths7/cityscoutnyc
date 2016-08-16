class AddFullAddressToCrimes < ActiveRecord::Migration[5.0]
  def change
    add_column :crimes, :full_address, :string
  end
end
