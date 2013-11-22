class Live < ActiveRecord::Base

  attr_accessible :title
  validates :title, :presence => true

  attr_accessible :start_date
  validates :start_date, :presence => true

  attr_accessible :place
  validates :place, :presence => true

  attr_accessible :address
  attr_accessible :map_url

end
