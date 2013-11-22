class Entry < ActiveRecord::Base

  belongs_to :live
  attr_accessible :live_id

  belongs_to :band
  attr_accessible :band_id

  attr_accessible :entry_no
  attr_accessible :deleted

  def band_name
    return nil unless band_id
    band.name
  end

end
