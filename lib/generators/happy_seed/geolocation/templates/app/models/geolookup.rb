class GeoipLookup < ActiveRecord::Base
  
  has_one :geolocation, :dependent=>:destroy
  has_many :geolocatables, :through=>:geolocation, :polymorphic => true
  
end
