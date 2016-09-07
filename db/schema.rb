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

ActiveRecord::Schema.define(version: 20160907192923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "genre"
  end

  create_table "clubs", force: :cascade do |t|
    t.string   "name"
    t.string   "status"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_clubs_on_book_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_messages_on_club_id", using: :btree
  end

  create_table "user_clubs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_user_clubs_on_club_id", using: :btree
    t.index ["user_id"], name: "index_user_clubs_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "favorite_books"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "clubs", "books"
  add_foreign_key "messages", "clubs"
  add_foreign_key "user_clubs", "clubs"
  add_foreign_key "user_clubs", "users"
end
