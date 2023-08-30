class AddForeignkey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tasks, :subgroups, column: :subgroup_id
  end
end
