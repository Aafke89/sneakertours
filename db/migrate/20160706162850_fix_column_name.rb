class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :locations, :langitude, :longitude
  end
end
