class Subgroup < ApplicationRecord
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'

  has_many :usergroups, dependent: :destroy
  has_many :users, through: :usergroups, source: :user
end
