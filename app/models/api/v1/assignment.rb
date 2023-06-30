class Api::V1::Assignment < ApplicationRecord
  belongs_to :user, class_name: 'Api::V1::User'
  belongs_to :task, class_name: 'Api::V1::Task'
end
