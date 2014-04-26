class Course < ActiveRecord::Base
  searchkick text_start: [:name]

  belongs_to :lecturer, class_name: 'User'
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :users, autosave: true

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

  def autocomplete
    render json: Course.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end
end
