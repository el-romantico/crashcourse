module Locatable
  extend ActiveSupport::Concern

  def location_address
    location.nil? ? '' : location.address
  end

  def location_city
    location.nil? ? '' : location.city
  end

end