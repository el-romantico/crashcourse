class Notification < ActiveRecord::Base
  belongs_to :lecturer, class_name: 'User'
  belongs_to :course
  belongs_to :request
  belongs_to :subscriber, class_name: 'User'

  validates :lecturer, presence: true
  validates :course, presence: true
  validates :request, presence: true
  validates :subscriber, presence: true
end
