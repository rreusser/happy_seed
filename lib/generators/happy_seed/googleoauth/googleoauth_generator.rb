require 'generators/happy_seed/happy_seed_generator'

module HappySeed
  module Generators
    class GoogleoauthGenerator < HappySeedGenerator
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      def install_facebook
        require_omniauth

        gem 'omniauth-google-oauth2'
        gem 'google-api-client', require: "google/api_client"

        Bundler.with_clean_env do
          run "bundle install > /dev/null"
        end

        directory 'docs'
        directory 'app'

        add_omniauth :google_oauth2, 'email,profile,offline", prompt: "consent', 'GoogleAppsClient', "google_oauth2"
        insert_into_file "app/models/identity.rb", "\n    identity.refreshtoken = auth.credentials.refresh_token", after: "identity.accesstoken = auth.credentials.token"
        migration_template("add_refresh_token_to_identity.rb", "db/migrate/add_refresh_token_to_identity.rb" )
      end

      protected
        def self.next_migration_number(dir)
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        end

    end
  end
end