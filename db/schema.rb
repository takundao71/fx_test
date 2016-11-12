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

ActiveRecord::Schema.define(version: 20161105162047) do

  create_table "hour_bars", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "currency_pair", limit: 10
    t.datetime "time_utc"
    t.decimal  "open_p",                   precision: 10, scale: 5,              unsigned: true
    t.decimal  "high_p",                   precision: 10, scale: 5,              unsigned: true
    t.decimal  "low_p",                    precision: 10, scale: 5,              unsigned: true
    t.decimal  "close_p",                  precision: 10, scale: 5,              unsigned: true
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["currency_pair", "time_utc"], name: "index_hour_bars_on_currency_pair_and_time_utc", unique: true, using: :btree
  end

end
