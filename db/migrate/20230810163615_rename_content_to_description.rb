class RenameContentToDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :content, :description
  end
end
