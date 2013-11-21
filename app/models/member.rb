class Member < ActiveRecord::Base

  has_many :band_members, :conditions => ['deleted = ?', false]
  accepts_nested_attributes_for :band_members

end
