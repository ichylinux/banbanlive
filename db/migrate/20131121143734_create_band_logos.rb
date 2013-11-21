class CreateBandLogos < ActiveRecord::Migration
  def change
    create_table :band_logos do |t|

      t.timestamps
    end
  end
end
