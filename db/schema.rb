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

ActiveRecord::Schema.define(version: 20160426151927) do

  create_table "aliases", force: :cascade do |t|
    t.integer  "domain_id",  limit: 4
    t.string   "from",       limit: 255
    t.text     "to",         limit: 65535
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
  end

  create_table "api_clients", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "access_token", limit: 65535
    t.boolean  "enabled"
    t.text     "observations", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "client_accesses", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "status",       limit: 255
    t.string   "reject_note",  limit: 255
    t.string   "rule",         limit: 255
    t.text     "observations", limit: 65535
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workgroup_id", limit: 4
  end

  create_table "recipient_accesses", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "status",       limit: 255
    t.string   "reject_note",  limit: 255
    t.string   "rule",         limit: 255
    t.text     "observations", limit: 65535
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipient_bccs", force: :cascade do |t|
    t.string   "from",       limit: 255
    t.string   "to",         limit: 255
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "domain_id",  limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sender_accesses", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "status",       limit: 255
    t.string   "reject_note",  limit: 255
    t.string   "rule",         limit: 255
    t.text     "observations", limit: 65535
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sender_bccs", force: :cascade do |t|
    t.string   "from",       limit: 255
    t.string   "to",         limit: 255
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "domain_id",  limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.integer  "domain_id",  limit: 4
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role_code",  limit: 255
  end

  create_table "workgroups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
