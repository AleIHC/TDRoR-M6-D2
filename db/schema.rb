# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_15_183327) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "trn_comments", force: :cascade do |t|
    t.text "content"
    t.bigint "trn_user_id", null: false
    t.bigint "trn_new_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trn_new_id"], name: "index_trn_comments_on_trn_new_id"
    t.index ["trn_user_id"], name: "index_trn_comments_on_trn_user_id"
  end

  create_table "trn_news", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trn_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role", default: 0
    t.index ["email"], name: "index_trn_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_trn_users_on_reset_password_token", unique: true
  end

  add_foreign_key "trn_comments", "trn_news"
  add_foreign_key "trn_comments", "trn_users"
end
