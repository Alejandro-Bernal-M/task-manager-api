class Api::V1::Subgroup < ApplicationRecord
  belongs_to :api_v1_group, class_name: 'Api::V1::Group', foreign_key: 'group_id'

  has_many :api_v1_usergroups, dependent: :destroy
  has_many :api_v1_users, through: :api_v1_usergroups, source: :user
end
