class Comment < ActiveRecord::Base
  attr_accessible :note_id
  belongs_to :note
end
