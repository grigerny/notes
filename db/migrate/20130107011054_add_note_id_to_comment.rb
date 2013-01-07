class AddNoteIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :note_id, :string
  end
end
