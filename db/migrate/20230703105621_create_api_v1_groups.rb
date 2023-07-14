class CreateApiV1Groups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.integer :author_id
      t.string :description

      t.timestamps
    end

    add_foreign_key :groups, :users, column: :author_id
  end
end
