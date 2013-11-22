class Band < ActiveRecord::Base

  attr_accessible :name
  validates :name, :presence => true,  :uniqueness => {:scope => :deleted}

  has_one :band_logo
  accepts_nested_attributes_for :band_logo, :reject_if => proc { |bl| bl['id'].blank? and bl['file'].blank? }
  attr_accessible :band_logo_attributes

  has_many :band_members, :conditions => ['deleted = ?', false]
  accepts_nested_attributes_for :band_members
  attr_accessible :band_members_attributes

  def self.search(condition)
    not_deleted
  end

end
