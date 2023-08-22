class Subgroup < ApplicationRecord
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'

  has_many :usergroups, dependent: :destroy
  has_many :users, through: :usergroups, source: :user
  has_many :invitations, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :group_id, presence: true
  validates :description, presence: true, length: { maximum: 255 }
end
