class AddCommentToNote < ActiveRecord::Migration
  def change
    add_column :notes, :comment, :string
  end
end
