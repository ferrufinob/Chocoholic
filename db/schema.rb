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

ActiveRecord::Schema.define(version: 2021_01_31_150517) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chocolate_tasting_terms", force: :cascade do |t|
    t.integer "tasting_term_id", null: false
    t.integer "chocolate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chocolate_id"], name: "index_chocolate_tasting_terms_on_chocolate_id"
    t.index ["tasting_term_id"], name: "index_chocolate_tasting_terms_on_tasting_term_id"
  end

  create_table "chocolates", force: :cascade do |t|
    t.string "brand"
    t.string "flavor"
    t.string "country"
    t.text "note"
    t.string "cocoa"
    t.integer "user_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_chocolates_on_category_id"
    t.index ["user_id"], name: "index_chocolates_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.integer "user_id", null: false
    t.integer "chocolate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chocolate_id"], name: "index_reviews_on_chocolate_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tasting_terms", force: :cascade do |t|
    t.string "term"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "chocolate_tasting_terms", "chocolates"
  add_foreign_key "chocolate_tasting_terms", "tasting_terms"
  add_foreign_key "chocolates", "categories"
  add_foreign_key "chocolates", "users"
  add_foreign_key "reviews", "chocolates"
  add_foreign_key "reviews", "users"
end
