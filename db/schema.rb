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

ActiveRecord::Schema.define(version: 20191023125503) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",        null: false
    t.integer  "postal_code",    null: false
    t.string   "prefecture",     null: false
    t.string   "city",           null: false
    t.string   "street_number",  null: false
    t.string   "building_name",  null: false
    t.integer  "delivery_phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_brands_on_ancestry", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.string   "customer_id", null: false
    t.string   "ecard_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "categories_brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id", null: false
    t.integer  "brand_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["brand_id"], name: "index_categories_brands_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_categories_brands_on_category_id", using: :btree
  end

  create_table "categories_sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id", null: false
    t.integer  "size_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_categories_sizes_on_category_id", using: :btree
    t.index ["size_id"], name: "index_categories_sizes_on_size_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "images_url", null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "item_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                  null: false
    t.integer  "item_id",                  null: false
    t.text     "comment",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_item_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_item_comments_on_user_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                               null: false
    t.integer  "price",                              null: false
    t.text     "explanation",          limit: 65535, null: false
    t.string   "condition",                          null: false
    t.string   "shipping_charge",                    null: false
    t.string   "delivery_source_area",               null: false
    t.string   "delivery_days",                      null: false
    t.integer  "commission",                         null: false
    t.integer  "profit",                             null: false
    t.integer  "category_id",                        null: false
    t.integer  "brand_id"
    t.integer  "size_id",                            null: false
    t.integer  "saler_id",                           null: false
    t.integer  "buyer_id"
    t.integer  "shipped_saler_id"
    t.integer  "received_buyer_id"
    t.integer  "like_num"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "how_to_ship",                        null: false
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["name"], name: "index_items_on_name", using: :btree
    t.index ["received_buyer_id"], name: "index_items_on_received_buyer_id", using: :btree
    t.index ["saler_id"], name: "index_items_on_saler_id", using: :btree
    t.index ["shipped_saler_id"], name: "index_items_on_shipped_saler_id", using: :btree
    t.index ["size_id"], name: "index_items_on_size_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_likes_on_item_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "reputations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "rater_id",                 null: false
    t.integer  "target_id",                null: false
    t.integer  "rate",                     null: false
    t.text     "comment",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["rater_id"], name: "index_reputations_on_rater_id", using: :btree
    t.index ["target_id"], name: "index_reputations_on_target_id", using: :btree
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_sizes_on_ancestry", using: :btree
  end

  create_table "trade_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                  null: false
    t.integer  "item_id",                  null: false
    t.text     "comment",    limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_trade_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_trade_comments_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                          null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "image_url",                                         null: false
    t.text     "profile",                limit: 65535
    t.string   "family_name",                                       null: false
    t.string   "first_name",                                        null: false
    t.string   "ja_family_name",                                    null: false
    t.string   "ja_first_name",                                     null: false
    t.integer  "birthday",                                          null: false
    t.integer  "authenticate_phone",                                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["authenticate_phone"], name: "index_users_on_authenticate_phone", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cards", "users"
  add_foreign_key "categories_brands", "brands"
  add_foreign_key "categories_brands", "categories"
  add_foreign_key "categories_sizes", "categories"
  add_foreign_key "categories_sizes", "sizes"
  add_foreign_key "images", "items"
  add_foreign_key "item_comments", "items"
  add_foreign_key "item_comments", "users"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "received_buyer_id"
  add_foreign_key "items", "users", column: "saler_id"
  add_foreign_key "items", "users", column: "shipped_saler_id"
  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
  add_foreign_key "reputations", "users", column: "rater_id"
  add_foreign_key "reputations", "users", column: "target_id"
  add_foreign_key "trade_comments", "items"
  add_foreign_key "trade_comments", "users"
end
