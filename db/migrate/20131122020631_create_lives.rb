class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.string :title, :null => false
      t.date :start_date, :null => false
      t.string :place, :null => false
      t.string :address
      t.string :map_url
      t.boolean :deleted, :null => false, :default => false
      t.timestamps
    end
  end
end
