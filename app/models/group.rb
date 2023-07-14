class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :subgroups, class_name: 'Subgroup', foreign_key: 'group_id', dependent: :destroy
end
