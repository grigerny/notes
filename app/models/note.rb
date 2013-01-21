class Note < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  attr_accessible :link, :title, :comment
  
  validates_exclusion_of :link, :in => ["http://"]
end
