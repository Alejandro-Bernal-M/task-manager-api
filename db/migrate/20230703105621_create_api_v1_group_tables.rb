class CreateApiV1GroupTables < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_group_tables do |t|
      t.string :title
      t.integer :author
      t.string :description

      t.timestamps
    end

    add_foreign_key :api_v1_group_tables, :api_v1_users, column: :author
  end
end
