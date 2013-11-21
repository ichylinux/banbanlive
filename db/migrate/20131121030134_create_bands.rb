class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, :null => false
      t.boolean :deleted, :null => false, :default => false
      t.timestamps
    end
  end
end
