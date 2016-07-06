class AddAddressToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :link, :string
    add_column :locations, :address, :string
    add_column :locations, :latitude, :float
    add_column :locations, :langitude, :float
  end
end
