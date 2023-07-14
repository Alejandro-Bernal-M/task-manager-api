class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.integer :author_id
      t.string :status

      t.timestamps
    end

    create_table :assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :task, index: true

      t.timestamps
    end

    add_foreign_key :tasks, :users, column: :author_id
  end
end
