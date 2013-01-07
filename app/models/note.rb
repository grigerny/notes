class Note < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  attr_accessible :link, :title, :comment
  
end
