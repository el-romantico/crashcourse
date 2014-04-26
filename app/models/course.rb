class Course < ActiveRecord::Base
  searchkick

  belongs_to :lecturer, class_name: 'User'
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :users, autosave: true

  validates :location, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

  mount_uploader :picture, CoursePictureUploader

  def enrolled?(user)
    users.include? user
  end
end
