class Api::V1::Group < ApplicationRecord
  belongs_to :api_v1_author, class_name: 'Api::V1::User', foreign_key: 'author_id'

  has_many :api_v1_subgroups, class_name: 'Api::V1::Subgroup', foreign_key: 'group_id', dependent: :destroy
end
