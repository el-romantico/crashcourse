class Tag < ActiveRecord::Base
  has_and_belongs_to_many :requests
  has_and_belongs_to_many :courses

  validates :label, presence: true, allow_blank: false
  validates :label, uniqueness: true
end
