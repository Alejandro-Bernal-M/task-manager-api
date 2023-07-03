class Api::V1::GroupTable < ApplicationRecord
  belongs_to :author, class_name: 'Api::V1::User', foreign_key: 'author_id'
end
