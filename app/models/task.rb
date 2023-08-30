class Task < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :subgroup, class_name: 'Subgroup', foreign_key: 'subgroup_id'

  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments, source: :user

end
