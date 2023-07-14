class CreateSubgroups < ActiveRecord::Migration[7.0]
  def change
    create_table :subgroups do |t|
      t.string :title
      t.integer :group_id

      t.timestamps
    end

    add_foreign_key :subgroups, :groups, column: :group_id
  end
end
