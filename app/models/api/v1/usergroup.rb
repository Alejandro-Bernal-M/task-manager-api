class Api::V1::Usergroup < ApplicationRecord
  belongs_to :api_v1_user, class_name: 'Api::V1::User'
  belongs_to :api_v1_subgroup, class_name: 'Api::V1::Subgroup'
end
