class Api::V1::Assignment < ApplicationRecord
  belongs_to :api_v1_user, class_name: 'Api::V1::User'
  belongs_to :api_v1_task, class_name: 'Api::V1::Task'
end
