class Location < ActiveRecord::Base
  acts_as_mappable :default_units => :kms
  belongs_to :user
end
