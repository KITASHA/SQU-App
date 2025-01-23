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

ActiveRecord::Schema[7.2].define(version: 2025_01_16_050700) do
  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bands", charset: "utf8mb3", force: :cascade do |t|
    t.string "band_name", limit: 30, null: false
    t.string "member_1"
    t.string "member_2"
    t.string "member_3"
    t.string "member_4"
    t.string "member_5"
    t.string "member_6"
    t.string "member_7"
    t.string "member_8"
    t.string "member_9"
    t.text "description", null: false
    t.string "link_name_1"
    t.string "link_url_1"
    t.string "link_name_2"
    t.string "link_url_2"
    t.string "link_name_3"
    t.string "link_url_3"
    t.string "link_name_4"
    t.string "link_url_4"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_bands_on_slug", unique: true
    t.index ["user_id"], name: "index_bands_on_user_id"
  end

  create_table "embeddings", charset: "utf8mb3", force: :cascade do |t|
    t.text "text"
    t.json "embedding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", charset: "utf8mb3", force: :cascade do |t|
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "finish_time", null: false
    t.string "location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gig_bands", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "gig_id", null: false
    t.bigint "band_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_gig_bands_on_band_id"
    t.index ["gig_id"], name: "index_gig_bands_on_gig_id"
  end

  create_table "gigs", charset: "utf8mb3", force: :cascade do |t|
    t.string "gig_name", limit: 50, null: false
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "end_time"
    t.text "description", null: false
    t.string "link_name"
    t.string "link_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.index ["user_id"], name: "index_gigs_on_user_id"
  end

  create_table "parts", charset: "utf8mb3", force: :cascade do |t|
    t.string "nickname", null: false
    t.integer "song_part_id_1"
    t.integer "song_part_id_2"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parts_on_user_id"
  end

  create_table "releases", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "form_url"
    t.string "image"
    t.boolean "selected", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", charset: "utf8mb3", force: :cascade do |t|
    t.string "song_title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", charset: "utf8mb3", force: :cascade do |t|
    t.date "date", null: false
    t.string "news", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", default: "", null: false
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bands", "users"
  add_foreign_key "gig_bands", "bands"
  add_foreign_key "gig_bands", "gigs"
  add_foreign_key "gigs", "users"
  add_foreign_key "parts", "users"
end
