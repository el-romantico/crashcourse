class Request < ActiveRecord::Base
  belongs_to :tag
  belongs_to :requester, class_name: 'User'

  validates :location, presence: true, allow_blank: false
end
