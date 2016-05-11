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

ActiveRecord::Schema.define(version: 20160511213437) do

  create_table "alerts", force: :cascade do |t|
    t.integer  "user_id",                             null: false
    t.integer  "product_id",                          null: false
    t.decimal  "desired",    precision: 10, scale: 2, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "alerts", ["product_id", "user_id"], name: "index_alerts_on_product_id_and_user_id", unique: true
  add_index "alerts", ["product_id"], name: "index_alerts_on_product_id"
  add_index "alerts", ["user_id"], name: "index_alerts_on_user_id"

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "price_histories", force: :cascade do |t|
    t.integer  "product_id",                          null: false
    t.decimal  "price",      precision: 10, scale: 2, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "price_histories", ["created_at"], name: "index_price_histories_on_created_at"
  add_index "price_histories", ["product_id"], name: "index_price_histories_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "staples_pid",  limit: 13,                                       null: false
    t.string   "name",         limit: 256
    t.decimal  "price",                    precision: 10, scale: 2
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "url",          limit: 256
    t.string   "image_url",    limit: 256
    t.string   "description",  limit: 256
    t.integer  "availability"
    t.integer  "alerts_count",                                      default: 0
  end

  add_index "products", ["staples_pid"], name: "index_products_on_staples_pid"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
