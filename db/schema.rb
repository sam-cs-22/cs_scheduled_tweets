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

ActiveRecord::Schema[7.0].define(version: 2022_04_04_201248) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
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

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "hive_module_subfunctions", force: :cascade do |t|
    t.string "name"
    t.string "note"
    t.bigint "hive_module_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hive_module_id"], name: "index_hive_module_subfunctions_on_hive_module_id"
  end

  create_table "hive_modules", force: :cascade do |t|
    t.string "name"
    t.string "default_landing_page"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hm_subfunctions", force: :cascade do |t|
    t.bigint "hive_module_id"
    t.bigint "hive_module_subfunction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hive_module_id"], name: "index_hm_subfunctions_on_hive_module_id"
    t.index ["hive_module_subfunction_id"], name: "index_hm_subfunctions_on_hive_module_subfunction_id"
  end

  create_table "module_composition_details", force: :cascade do |t|
    t.bigint "module_page_id"
    t.bigint "module_entity_page_id"
    t.bigint "ui_element_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["module_entity_page_id"], name: "index_module_composition_details_on_module_entity_page_id"
    t.index ["module_page_id"], name: "index_module_composition_details_on_module_page_id"
    t.index ["ui_element_id"], name: "index_module_composition_details_on_ui_element_id"
  end

  create_table "module_entity_page_details", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_page_id"
    t.integer "child_page_id"
  end

  create_table "module_entity_pages", force: :cascade do |t|
    t.bigint "module_page_id"
    t.string "module_entity_page_name"
    t.integer "page_type"
    t.string "page_avatar"
    t.string "source_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["module_page_id"], name: "index_module_entity_pages_on_module_page_id"
  end

  create_table "module_fas", force: :cascade do |t|
    t.string "file_avatar"
    t.string "name"
    t.string "source_url"
    t.string "source_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hive_module_id"
    t.string "note"
  end

  create_table "module_pages", force: :cascade do |t|
    t.string "module_page_name"
    t.boolean "navigation_header"
    t.string "source_url"
    t.integer "page_type"
    t.string "page_avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "app_type", default: 0
    t.string "notes"
    t.integer "sort"
  end

  create_table "module_tcs", force: :cascade do |t|
    t.string "file_avatar"
    t.string "name"
    t.string "source_url"
    t.string "source_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hive_module_id"
    t.string "note"
  end

  create_table "subfunction_pages", force: :cascade do |t|
    t.bigint "hive_module_subfunction_id"
    t.bigint "module_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hive_module_subfunction_id"], name: "index_subfunction_pages_on_hive_module_subfunction_id"
    t.index ["module_page_id"], name: "index_subfunction_pages_on_module_page_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "twitter_account_id", null: false
    t.text "body"
    t.datetime "publish_at", precision: nil
    t.string "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twitter_account_id"], name: "index_tweets_on_twitter_account_id"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "username"
    t.string "image"
    t.string "token"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_twitter_accounts_on_user_id"
  end

  create_table "ui_element_categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ui_elements", force: :cascade do |t|
    t.string "element_name"
    t.text "element_discription"
    t.string "element_avatar"
    t.string "usage_details"
    t.bigint "ui_element_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ui_element_category_id"], name: "index_ui_elements_on_ui_element_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "tweets", "twitter_accounts"
  add_foreign_key "tweets", "users"
  add_foreign_key "twitter_accounts", "users"
end
