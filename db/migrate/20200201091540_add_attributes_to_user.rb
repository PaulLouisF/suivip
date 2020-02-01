class AddAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :specialist, :boolean
    add_column :users, :city, :string
    add_column :users, :healthcare_center, :string
  end
end
