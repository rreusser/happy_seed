module Geolocatable
  extend ActiveSupport::Concern

  included do
    has_one :geolocation, :dependent=>:destroy
    has_one :geoip_lookup, :through=>:geolocation
  end


  module ClassMethods
    def geolocate
      
    end
  end

end
