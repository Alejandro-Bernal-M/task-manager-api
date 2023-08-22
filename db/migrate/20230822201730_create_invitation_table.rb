class CreateInvitationTable < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.integer :author_id
      t.integer :user_id
      t.integer :subgroup_id
      t.string :status

      t.timestamps
    end
  end
end
