require 'rails/generators/active_record'

module HappySeed
  module Generators
    class GeolocationGenerator < Rails::Generators::Base

      include Rails::Generators::Migration
      include ActiveRecord::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def install_geolocation
        directory 'app/models'

        migration_template 'db/migrate/create_geolocatables.rb', 'db/migration/create_geolocatables.rb'
      end

    end
  end
end
