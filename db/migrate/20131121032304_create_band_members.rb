class CreateBandMembers < ActiveRecord::Migration
  def change
    create_table :band_members do |t|
      t.integer :band_id, :null => false
      t.integer :member_id, :null => false
      t.boolean :deleted, :null => false, :default => false
      t.timestamps
    end
  end
end
