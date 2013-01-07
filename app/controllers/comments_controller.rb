class CommentsController < ApplicationController
  def create
    @note = Note.find(params[:note_id]
    @comment = @note.comment.build(params[:comment])
    @comment.save
  end    
end