class CreateApiV1Tasks < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_tasks do |t|
      t.string :title
      t.string :content
      t.integer :author_id
      t.string :status

      t.timestamps
    end

    create_table :api_v1_assignments do |t|
      t.belongs_to :api_v1_user, index: true
      t.belongs_to :api_v1_task, index: true

      t.timestamps
    end

    add_foreign_key :api_v1_tasks, :api_v1_users, column: :author_id
  end
end
