class Band < ActiveRecord::Base

  validates :name, :presence => true,  :uniqueness => {:scope => :deleted}

  has_many :band_members, :conditions => ['deleted = ?', false]
  accepts_nested_attributes_for :band_members

end
