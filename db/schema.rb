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

ActiveRecord::Schema.define(version: 2022_01_05_231901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "title_color", default: "#F72585", null: false
    t.string "subtitle_color", default: "#C2F7EB", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "description_templates", force: :cascade do |t|
    t.text "template", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_description_templates_on_user_id"
  end

  create_table "presenters", force: :cascade do |t|
    t.string "name", null: false
    t.string "twitter_handle"
    t.string "linked_in"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_presenters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "youtube_channel_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "video_presenters", force: :cascade do |t|
    t.bigint "video_id", null: false
    t.bigint "presenter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["presenter_id"], name: "index_video_presenters_on_presenter_id"
    t.index ["video_id", "presenter_id"], name: "index_video_presenters_on_video_id_and_presenter_id", unique: true
    t.index ["video_id"], name: "index_video_presenters_on_video_id"
  end

  create_table "video_resources", force: :cascade do |t|
    t.string "url", null: false
    t.string "title", null: false
    t.bigint "video_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["video_id"], name: "index_video_resources_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "youtube_id", null: false
    t.string "title", null: false
    t.string "tags", default: [], array: true
    t.text "chapter_markers"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "description_template_id", null: false
    t.text "summary"
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.text "description", default: ""
    t.index ["category_id"], name: "index_videos_on_category_id"
    t.index ["description_template_id"], name: "index_videos_on_description_template_id"
    t.index ["user_id"], name: "index_videos_on_user_id"
    t.index ["youtube_id"], name: "index_videos_on_youtube_id", unique: true
  end

  create_table "youtube_sessions", force: :cascade do |t|
    t.string "session_token", null: false
    t.json "credentials"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["session_token"], name: "index_youtube_sessions_on_session_token"
    t.index ["user_id"], name: "index_youtube_sessions_on_user_id"
  end

  add_foreign_key "categories", "users"
  add_foreign_key "description_templates", "users"
  add_foreign_key "presenters", "users"
  add_foreign_key "video_presenters", "presenters"
  add_foreign_key "video_presenters", "videos"
  add_foreign_key "video_resources", "videos"
  add_foreign_key "videos", "categories"
  add_foreign_key "videos", "description_templates"
  add_foreign_key "videos", "users"
  add_foreign_key "youtube_sessions", "users"
end
