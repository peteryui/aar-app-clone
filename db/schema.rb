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

ActiveRecord::Schema.define(version: 20160216151114) do

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "todos_count", default: 0
  end

  create_table "invitations", force: :cascade do |t|
    t.string   "code"
    t.string   "email_address"
    t.integer  "team_id"
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.string   "status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "media", force: :cascade do |t|
    t.string   "file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "subject"
    t.text     "should_happen"
    t.text     "actual_happen"
    t.text     "improvement_plan"
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "team_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "comments_count",   default: 0
    t.integer  "todos_count",      default: 0
  end

  create_table "team_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "role",       default: "member"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "domain"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "todos_count", default: 0
  end

  create_table "todos", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "team_id"
    t.integer  "review_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "status"
    t.integer  "comments_count", default: 0
  end

  add_index "todos", ["status"], name: "index_todos_on_status"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
