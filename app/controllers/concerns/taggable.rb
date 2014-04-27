module Taggable
  include Geokit::Geocoders
  extend ActiveSupport::Concern

  def extract_tags(tag_labels)
    tag_labels.split(',').map { |tag| Tag.where(:label => tag.strip).first_or_create }
  end
end