class Band < ActiveRecord::Base

  attr_accessible :name
  validates :name, :presence => true,  :uniqueness => {:scope => :deleted}

  has_many :band_members, :conditions => ['deleted = ?', false]
  accepts_nested_attributes_for :band_members
  attr_accessible :band_members_attributes

end
