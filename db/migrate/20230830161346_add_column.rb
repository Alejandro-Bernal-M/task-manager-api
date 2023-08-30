class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :subgroup_id, :integer
  end
end
