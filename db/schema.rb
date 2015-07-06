# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150706195903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string  "title",     limit: 160, null: false
    t.integer "artist_id",             null: false
  end

  add_index "albums", ["artist_id"], name: "index_album_on_artist_id", using: :btree
  add_index "albums", ["id"], name: "index_album_on_id", unique: true, using: :btree

  create_table "artists", force: :cascade do |t|
    t.string "name", limit: 120
  end

  add_index "artists", ["id"], name: "index_artist_on_id", unique: true, using: :btree

  create_table "challenges", force: :cascade do |t|
    t.string   "instructions"
    t.string   "query"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "order"
    t.json     "metadata"
  end

  create_table "customers", force: :cascade do |t|
    t.string  "first_name",     limit: 40, null: false
    t.string  "last_name",      limit: 20, null: false
    t.string  "company",        limit: 80
    t.string  "address",        limit: 70
    t.string  "city",           limit: 40
    t.string  "state",          limit: 40
    t.string  "country",        limit: 40
    t.string  "postal_code",    limit: 10
    t.string  "phone",          limit: 24
    t.string  "fax",            limit: 24
    t.string  "email",          limit: 60, null: false
    t.integer "support_rep_id"
  end

  add_index "customers", ["id"], name: "index_customer_on_id", unique: true, using: :btree
  add_index "customers", ["support_rep_id"], name: "index_customers_on_support_rep_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "last_name",   limit: 20, null: false
    t.string   "first_name",  limit: 20, null: false
    t.string   "title",       limit: 30
    t.integer  "reports_to"
    t.datetime "birth_date"
    t.datetime "hire_date"
    t.string   "address",     limit: 70
    t.string   "city",        limit: 40
    t.string   "state",       limit: 40
    t.string   "country",     limit: 40
    t.string   "postal_code", limit: 10
    t.string   "phone",       limit: 24
    t.string   "fax",         limit: 24
    t.string   "email",       limit: 60
  end

  add_index "employees", ["id"], name: "index_employee_on_id", unique: true, using: :btree
  add_index "employees", ["reports_to"], name: "index_employees_on_reports_to", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string "name", limit: 120
  end

  add_index "genres", ["id"], name: "index_genre_on_id", unique: true, using: :btree

  create_table "invoice_lines", force: :cascade do |t|
    t.integer "invoice_id",                          null: false
    t.integer "track_id",                            null: false
    t.decimal "unit_price", precision: 10, scale: 2, null: false
    t.integer "quantity",                            null: false
  end

  add_index "invoice_lines", ["id"], name: "index_invoice_line_on_id", unique: true, using: :btree
  add_index "invoice_lines", ["invoice_id"], name: "index_invoice_lines_on_invoice_id", using: :btree
  add_index "invoice_lines", ["track_id"], name: "index_invoice_lines_on_track_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.integer  "customer_id",                                             null: false
    t.datetime "invoice_date",                                            null: false
    t.string   "billing_address",     limit: 70
    t.string   "billing_city",        limit: 40
    t.string   "billing_state",       limit: 40
    t.string   "billing_country",     limit: 40
    t.string   "billing_postal_code", limit: 10
    t.decimal  "total",                          precision: 10, scale: 2, null: false
  end

  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id", using: :btree
  add_index "invoices", ["id"], name: "index_invoice_on_id", unique: true, using: :btree

  create_table "media_types", force: :cascade do |t|
    t.string "name", limit: 120
  end

  add_index "media_types", ["id"], name: "index_media_type_on_id", unique: true, using: :btree

  create_table "playlist_tracks", id: false, force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "track_id",    null: false
  end

  add_index "playlist_tracks", ["playlist_id", "track_id"], name: "index_playlist_track_on_id", unique: true, using: :btree
  add_index "playlist_tracks", ["track_id"], name: "index_playlist_tracks_on_track_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string "name", limit: 120
  end

  add_index "playlists", ["id"], name: "index_playlist_on_id", unique: true, using: :btree

  create_table "tracks", force: :cascade do |t|
    t.string  "name",          limit: 200,                          null: false
    t.integer "album_id"
    t.integer "media_type_id",                                      null: false
    t.integer "genre_id"
    t.string  "composer",      limit: 220
    t.integer "milliseconds",                                       null: false
    t.integer "bytes"
    t.decimal "unit_price",                precision: 10, scale: 2, null: false
  end

  add_index "tracks", ["album_id"], name: "index_tracks_on_album_id", using: :btree
  add_index "tracks", ["genre_id"], name: "index_track_on_genre_id", using: :btree
  add_index "tracks", ["id"], name: "index_track_on_id", unique: true, using: :btree
  add_index "tracks", ["media_type_id"], name: "index_track_on_media_type_id", using: :btree

  add_foreign_key "albums", "artists", name: "albums_artist_id_fkey"
  add_foreign_key "customers", "employees", column: "support_rep_id", name: "customers_support_rep_id_fkey"
  add_foreign_key "employees", "employees", column: "reports_to", name: "employees_reports_to_fkey"
  add_foreign_key "invoice_lines", "invoices", name: "invoice_lines_invoice_id_fkey"
  add_foreign_key "invoice_lines", "tracks", name: "invoice_lines_track_id_fkey"
  add_foreign_key "invoices", "customers", name: "invoices_customer_id_fkey"
  add_foreign_key "playlist_tracks", "playlists", name: "playlist_tracks_playlist_id_fkey"
  add_foreign_key "playlist_tracks", "tracks", name: "playlist_tracks_track_id_fkey"
  add_foreign_key "tracks", "albums", name: "tracks_album_id_fkey"
  add_foreign_key "tracks", "genres", name: "tracks_genre_id_fkey"
  add_foreign_key "tracks", "media_types", name: "tracks_media_type_id_fkey"
end
