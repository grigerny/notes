class RemoveNoteIdFromComment < ActiveRecord::Migration
  def up
    change_column :comments, :note_id, :integer
  end

  def down
    change_column :comments, :note_id, :string
  end
end
