class Course < ActiveRecord::Base
  include Locatable

  searchkick word_middle: [:name]

  belongs_to :lecturer, class_name: 'User'
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :users, autosave: true
  belongs_to :location
  has_many :notifications, :foreign_key => 'course_id', :class_name => "Notification"

  validates :location, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

  mount_uploader :picture, CoursePictureUploader

  def enrolled?(user)
    users.include? user
  end

  def search_data
    {
      name: name,
      location: location,
      description: description,
      tags: tags.map(&:label).join(" "),
    }
  end

end
