class Comment < ActiveRecord::Base
  attr_accessible :note_id, :text
  belongs_to :note
end
