class Note < ActiveRecord::Base
  belongs_to :user
  attr_accessible :link, :title, :comment
  has_many :comments
  
end
