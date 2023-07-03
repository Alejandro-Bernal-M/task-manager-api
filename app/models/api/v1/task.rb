class Api::V1::Task < ApplicationRecord
  belongs_to :api_v1_author, class_name: 'Api::V1::User', foreign_key: 'author_id'

  has_many :api_v1_assignments, dependent: :destroy
  has_many :api_v1_users, through: :assignments, source: :user
end
