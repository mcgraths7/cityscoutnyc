class AddStateToSchool < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :state, :string
  end
end
