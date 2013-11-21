class Band < ActiveRecord::Base

  validates :name, :presence => true,  :uniqueness => {:scope => :deleted}

end
