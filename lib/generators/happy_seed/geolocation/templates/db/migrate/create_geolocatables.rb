class CreateGeolocatables < ActiveRecord::Migration
  def change

    create_table "geoip_lookups", force: true do |t| 
      t.string  "ip",           null: false
      t.string  "country_name"
      t.string  "region_name"
      t.string  "country_code"
      t.string  "region_code"
      t.string  "zipcode"
      t.string  "metro_code"
      t.string  "area_code"
      t.string  "city"
      t.decimal "latitude"
      t.decimal "longitude"
      t.timestamps
    end 

    add_index "geoip_lookups", ["ip"], name: "index_geoip_lookups_on_ip", unique: true, using: :btree
  

    create_table :geolocations do |t|
      t.integer :geoip_lookup_id, :null=>false
      t.integer :geolocatable_id, :null=>false
      t.string :geolocatable_type, :null=>false
      t.timestamps
    end

  end
end
