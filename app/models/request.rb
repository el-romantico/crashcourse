class Request < ActiveRecord::Base
  include Locatable

  has_and_belongs_to_many :tags
  belongs_to :requester, class_name: 'User'
  belongs_to :location

  validates :location, presence: true, allow_blank: false
end
