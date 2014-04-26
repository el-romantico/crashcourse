class Course < ActiveRecord::Base
  searchkick

  has_many :tags
  belongs_to :lecturer, class_name: 'User'
  has_and_belongs_to_many :tags

  validates :location, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false
end
