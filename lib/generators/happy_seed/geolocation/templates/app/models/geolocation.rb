class Geolocation < ActiveRecord::Base

  belongs_to :geolocatable, :polymorphic => true
  belongs_to :geoip_lookup

end
