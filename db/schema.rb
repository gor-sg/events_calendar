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

ActiveRecord::Schema.define(version: 2019_04_20_124411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "source_id", null: false
    t.string "title", null: false
    t.string "description", null: false
    t.date "date_start", null: false
    t.date "date_end", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_events_on_source_id"
    t.index ["title", "source_id", "date_start", "date_end"], name: "index_events_on_title_and_source_id_and_date_start_and_date_end", unique: true
  end

  create_table "sources", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_sources_on_name", unique: true
  end

  add_foreign_key "events", "sources"
end
