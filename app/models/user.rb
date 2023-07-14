class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  has_many :assignments, dependent: :destroy
  has_many :tasks, through: :assignments, source: :task
  has_many :authored_tasks, class_name: 'Task', foreign_key: 'author_id', dependent: :destroy
  has_many :groups, foreign_key: 'author_id', dependent: :destroy
  has_many :usergroups, dependent: :destroy
  has_many :subgroups, through: :usergroups, source: :subgroup
end
