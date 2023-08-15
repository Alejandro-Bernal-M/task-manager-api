class Usergroup < ApplicationRecord
  belongs_to :user, class_name: 'Api::V1::Users'
  belongs_to :subgroup, class_name: 'Api::V1::Subgroups'
end
