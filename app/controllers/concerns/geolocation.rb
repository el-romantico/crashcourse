module Geolocation
  include Geokit::Geocoders
  extend ActiveSupport::Concern

  def geocode_location(location)
    geolocation = GoogleGeocoder.geocode(location)

    Location.new({lat: geolocation.lat,
                  lng: geolocation.lng,
                  address: location,
                  city: geolocation.city,
                  country: geolocation.country}) if geolocation.success
  end

end