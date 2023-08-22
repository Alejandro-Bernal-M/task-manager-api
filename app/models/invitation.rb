class Invitation < ApplicationRecord
  belongs_to :subgroup
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :author_id, presence: true
  validates :user_id, presence: true
  validates :subgroup_id, presence: true
  validates :status, presence: true, length: {minimum: 4, maximum: 50 }

end