class AddStuffToEvents < ActiveRecord::Migration
  def change
    add_column :events, :email, :string
    add_column :events, :status, :string
  end
end
