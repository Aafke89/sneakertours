class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :image
      t.references :location, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
