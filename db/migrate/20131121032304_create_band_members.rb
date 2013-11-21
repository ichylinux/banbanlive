class CreateBandMembers < ActiveRecord::Migration
  def change
    create_table :band_members do |t|

      t.timestamps
    end
  end
end
