class Note < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  attr_accessible :link, :title, :comment, :tag_list
  acts_as_taggable
  
  validates_exclusion_of :link, :in => ["http://"]

 
end
