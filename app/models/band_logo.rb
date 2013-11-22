class BandLogo < ActiveRecord::Base
  belongs_to :band

  attr_accessible :file
  mount_uploader :file, BandLogoUploader

end
