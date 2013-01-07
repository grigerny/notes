class CommentsController < ApplicationController
  def create
    @note = Note.find(params[:note_id]
    @comment = @note.comment.build(params[:comment])
  
  respond_to do |format|
    if @comment.save
      format.html { redirect_to root_url, notice: 'You added a comment.' }
      format.json { render json: @comment, status: :created, location: @comment }
    else
      format.html { render action: "new" }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
      
end
