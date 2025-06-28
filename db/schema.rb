# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_06_28_184735) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", limit: 2, null: false
    t.string "timezone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_countries_on_code", unique: true
  end

  create_table "episodes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "season", null: false
    t.integer "number", null: false
    t.text "summary"
    t.integer "runtime"
    t.string "image_original"
    t.string "image_medium"
    t.string "url", null: false
    t.decimal "rating_average", precision: 3, scale: 1
    t.bigint "show_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id", "season", "number"], name: "index_episodes_on_show_id_and_season_and_number", unique: true
    t.index ["show_id"], name: "index_episodes_on_show_id"
  end

  create_table "networks", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id", null: false
    t.string "official_site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_networks_on_country_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name", null: false
    t.text "summary"
    t.string "language"
    t.string "status"
    t.integer "runtime"
    t.date "premiered"
    t.date "ended"
    t.string "official_site"
    t.string "schedule_time"
    t.string "schedule_days", default: [], array: true
    t.decimal "rating_average", precision: 3, scale: 1
    t.bigint "network_id"
    t.string "show_type"
    t.string "genres", default: [], array: true
    t.string "image_original"
    t.string "image_medium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["network_id"], name: "index_shows_on_network_id"
  end

  add_foreign_key "episodes", "shows"
  add_foreign_key "networks", "countries"
  add_foreign_key "shows", "networks"
end
