class AddFullAddressToCitibikes < ActiveRecord::Migration[5.0]
  def change
    add_column :citibikes, :full_address, :string
  end
end
