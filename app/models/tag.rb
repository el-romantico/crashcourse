class Tag < ActiveRecord::Base
  has_many :requests

  validates :label, presence: true, allow_blank: false
  validates :label, uniqueness: true
end
