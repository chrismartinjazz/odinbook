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

ActiveRecord::Schema[7.1].define(version: 2024_04_15_220058) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.integer "status"
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.bigint "comment_reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_reply_id"], name: "index_comments_on_comment_reply_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "following_user_id"
    t.bigint "followed_user_id"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_user_id"], name: "index_follows_on_followed_user_id"
    t.index ["following_user_id", "followed_user_id"], name: "index_follows_on_following_user_id_and_followed_user_id", unique: true
    t.index ["following_user_id"], name: "index_follows_on_following_user_id"
  end

  create_table "liked_comments", force: :cascade do |t|
    t.bigint "user_liked_comment_id"
    t.bigint "comment_liked_by_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_liked_by_user_id"], name: "index_liked_comments_on_comment_liked_by_user_id"
    t.index ["user_liked_comment_id", "comment_liked_by_user_id"], name: "idx_on_user_liked_comment_id_comment_liked_by_user__2811a44eb5", unique: true
    t.index ["user_liked_comment_id"], name: "index_liked_comments_on_user_liked_comment_id"
  end

  create_table "liked_posts", force: :cascade do |t|
    t.bigint "user_liked_post_id"
    t.bigint "post_liked_by_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_liked_by_user_id"], name: "index_liked_posts_on_post_liked_by_user_id"
    t.index ["user_liked_post_id", "post_liked_by_user_id"], name: "idx_on_user_liked_post_id_post_liked_by_user_id_a91299c549", unique: true
    t.index ["user_liked_post_id"], name: "index_liked_posts_on_user_liked_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "body", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "comments", column: "comment_reply_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "follows", "users", column: "followed_user_id"
  add_foreign_key "follows", "users", column: "following_user_id"
  add_foreign_key "liked_comments", "comments", column: "user_liked_comment_id"
  add_foreign_key "liked_comments", "users", column: "comment_liked_by_user_id"
  add_foreign_key "liked_posts", "posts", column: "user_liked_post_id"
  add_foreign_key "liked_posts", "users", column: "post_liked_by_user_id"
  add_foreign_key "posts", "users"
  add_foreign_key "profiles", "users"
end