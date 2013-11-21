class BandMember < ActiveRecord::Base
  belongs_to :band
  belongs_to :member
end
