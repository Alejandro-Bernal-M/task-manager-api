class Task < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments, source: :user
end
