class AddColumnInstrumentIdOnBandMembers < ActiveRecord::Migration
  def up
    add_column :band_members, :instrument_id, :integer
  end

  def down
    remove_column :band_members, :instrument_id
  end
end
