class Api::V1::Usergroup < ApplicationRecord
  belongs_to :user, class_name: 'Api::V1::User'
  belongs_to :subgroup, class_name: 'Api::V1::Subgroup'
end
