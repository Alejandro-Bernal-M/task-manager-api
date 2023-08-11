class Task < ApplicationRecord
  after_create :set_order_to_id
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :assignments, dependent: :destroy
  has_many :users, through: :assignments, source: :user


  private

  def set_order_to_id
    self.order = self.id
  end
end
