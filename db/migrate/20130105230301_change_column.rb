class ChangeColumn < ActiveRecord::Migration
  def up
    change_column :notes, :comment, :text
  end

  def down
    change_column :notes, :comment, :string
  end
end
