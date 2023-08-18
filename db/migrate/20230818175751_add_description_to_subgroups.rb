class AddDescriptionToSubgroups < ActiveRecord::Migration[7.0]
  def change
    add_column :subgroups, :description, :text
  end
end
