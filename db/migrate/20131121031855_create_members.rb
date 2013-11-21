class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :last_name
      t.string :first_name
      t.boolean :deleted, :null => false, :default => false
      t.timestamps
    end
  end
end
