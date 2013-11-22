# coding: UTF-8

class Live < ActiveRecord::Base

  attr_accessible :title
  validates :title, :presence => true

  attr_accessible :start_date
  validates :start_date, :presence => true

  attr_accessible :place
  validates :place, :presence => true

  attr_accessible :address
  attr_accessible :map_url

  has_many :entries, :conditions => ['deleted = ?', false]
  accepts_nested_attributes_for :entries
  attr_accessible :entries_attributes

end
