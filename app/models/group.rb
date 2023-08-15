class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :subgroups, class_name: 'Subgroup', foreign_key: 'group_id', dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  validates :author_id, presence: true
end
