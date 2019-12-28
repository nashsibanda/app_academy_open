# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_28_115922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "moderator_moderated_subs", force: :cascade do |t|
    t.bigint "moderator_id"
    t.bigint "sub_id"
    t.index ["moderator_id"], name: "index_moderator_moderated_subs_on_moderator_id"
    t.index ["sub_id"], name: "index_moderator_moderated_subs_on_sub_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.string "url"
    t.text "content"
    t.bigint "sub_id"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "crosspost_parent_id"
    t.index ["author_id"], name: "index_posts_on_author_id"
    t.index ["crosspost_parent_id"], name: "index_posts_on_crosspost_parent_id"
    t.index ["sub_id"], name: "index_posts_on_sub_id"
    t.index ["title"], name: "index_posts_on_title"
  end

  create_table "subs", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "sidebar"
    t.index ["name"], name: "index_subs_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "session_token", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "moderator_moderated_subs", "subs"
  add_foreign_key "moderator_moderated_subs", "users", column: "moderator_id"
  add_foreign_key "posts", "subs"
  add_foreign_key "posts", "users", column: "author_id"
end
