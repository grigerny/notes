class RemoveNoteIdFromComments < ActiveRecord::Migration
  def up
    remove_column :comments, :note_id
  end

  def down
    add_column :comments, :note_id, :string
  end
end
