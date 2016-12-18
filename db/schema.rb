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

ActiveRecord::Schema.define(version: 20161218193833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battings", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.integer  "runs"
    t.integer  "balls"
    t.integer  "fours"
    t.integer  "sixes"
    t.float    "strik_rake"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bowlings", force: :cascade do |t|
    t.string   "name"
    t.float    "overs"
    t.integer  "maidens"
    t.integer  "runs"
    t.integer  "wickets"
    t.float    "economy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scorecards", force: :cascade do |t|
    t.string   "url"
    t.integer  "batting_id"
    t.integer  "bowling_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "scorecards", ["batting_id"], name: "index_scorecards_on_batting_id", using: :btree
  add_index "scorecards", ["bowling_id"], name: "index_scorecards_on_bowling_id", using: :btree

  add_foreign_key "scorecards", "battings"
  add_foreign_key "scorecards", "bowlings"
end
