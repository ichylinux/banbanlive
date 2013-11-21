class Member < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :band_members, :conditions => ['deleted = ?', false]
  accepts_nested_attributes_for :band_members

  def self.search(condition)
    not_deleted
  end

  def full_name
    last_name.to_s + first_name.to_s
  end

end
