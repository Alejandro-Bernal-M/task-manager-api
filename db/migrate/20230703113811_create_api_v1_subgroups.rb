class CreateApiV1Subgroups < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_subgroups do |t|
      t.string :title
      t.integer :group_id

      t.timestamps
    end

    add_foreign_key :api_v1_subgroups, :api_v1_groups, column: :group_id
  end
end
