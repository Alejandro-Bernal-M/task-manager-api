class Api::V1::User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :api_v1_assignments, dependent: :destroy
  has_many :api_v1_tasks, through: :api_v1_assignments, source: :task
  has_many :api_v1_authored_tasks, class_name: 'Api::V1::Task', foreign_key: 'author_id', dependent: :destroy
  has_many :api_v1_groups, foreign_key: 'author_id', dependent: :destroy
end
