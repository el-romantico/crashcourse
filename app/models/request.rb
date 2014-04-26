class Request < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :requester, class_name: 'User'

  validates :location, presence: true, allow_blank: false
end
