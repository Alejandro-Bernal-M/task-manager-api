class CreateApiV1Usergroups < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_usergroups do |t|
      t.belongs_to :api_v1_user, index: true
      t.belongs_to :api_v1_subgroup, index: true

      t.timestamps
    end
  end
end
