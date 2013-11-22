class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :live_id, :null => false
      t.integer :band_id, :null => false
      t.integer :entry_no, :null => false
      t.boolean :deleted, :null => false, :default => false
      t.timestamps
    end
  end
end
