class AddImagecacheToEvents < ActiveRecord::Migration
  def change
    add_column :events, :image_cache, :string
  end
end
