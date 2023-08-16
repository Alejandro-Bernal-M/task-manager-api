class Usergroup < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :subgroup, class_name: 'Subgroup'
end
