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

ActiveRecord::Schema.define(version: 2020_03_10_035313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "steps", force: :cascade do |t|
    t.string "title", null: false
    t.string "body"
    t.boolean "done", default: false, null: false
    t.bigint "todo_id"
    t.index ["title"], name: "index_steps_on_title"
    t.index ["todo_id"], name: "index_steps_on_todo_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title", null: false
    t.string "body"
    t.boolean "done", default: false, null: false
    t.date "due"
    t.index ["title"], name: "index_todos_on_title"
  end

  add_foreign_key "steps", "todos"
end