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

ActiveRecord::Schema.define(version: 20130910124603) do

  create_table "aliases", force: true do |t|
    t.integer  "domain_id"
    t.string   "from"
    t.text     "to"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", force: true do |t|
    t.string   "name"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipient_bccs", force: true do |t|
    t.string   "from"
    t.string   "to"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "domain_id"
  end

  create_table "sender_bccs", force: true do |t|
    t.string   "from"
    t.string   "to"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "domain_id"
  end

  create_table "users", force: true do |t|
    t.integer  "domain_id"
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
