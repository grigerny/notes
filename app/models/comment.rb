class Comment < ActiveRecord::Base
  attr_accessible :note_id, :text
  belongs_to :note
  
  validates :text, :presence => { :message => "Your comment can not be blank" }
end
