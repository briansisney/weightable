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

ActiveRecord::Schema.define(version: 20131223175330) do

  create_table "comments", force: true do |t|
    t.string   "comment"
    t.integer  "weight_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"
  add_index "comments", ["weight_id"], name: "index_comments_on_weight_id"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_weights", force: true do |t|
    t.integer  "user_id"
    t.integer  "weight_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_weights", ["user_id"], name: "index_user_weights_on_user_id"
  add_index "user_weights", ["weight_id"], name: "index_user_weights_on_weight_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "pic"
    t.integer  "goal"
    t.integer  "weight_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["weight_id"], name: "index_users_on_weight_id"

  create_table "weights", force: true do |t|
    t.string   "date"
    t.integer  "weight"
    t.string   "pic"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weights", ["comment_id"], name: "index_weights_on_comment_id"
  add_index "weights", ["user_id"], name: "index_weights_on_user_id"

end
