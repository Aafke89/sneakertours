class AddEmailToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :email, :string
    add_column :locations, :status, :string
  end
end
