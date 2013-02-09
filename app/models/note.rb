class Note < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  attr_accessible :link, :title, :comment, :tag_list
  acts_as_taggable
  
  validates_exclusion_of :link, :in => ["http://"]
  validates_format_of :link, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

 
end
