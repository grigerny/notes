class CommentsController < ApplicationController
  def create
    @note = Note.find(params[:note_id])
      @comment = @note.comments.build(params[:comment])

      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        redirect_to(root_path)
      else
        flash[:notice] = "Error creating comment: #{@comment.errors}"
        redirect_to(root_path)
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to(root_path)
    end
end