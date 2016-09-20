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

ActiveRecord::Schema.define(version: 20160920144358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "alcohols", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "address"
    t.string   "complement"
    t.integer  "postal_code"
    t.string   "city"
    t.string   "country"
    t.integer  "capacity"
    t.string   "siret"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fermentations", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kinds", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "deposit_id"
    t.integer  "user_id"
    t.string   "delivery"
    t.string   "address"
    t.string   "complement"
    t.string   "postal_code"
    t.string   "city"
    t.string   "country"
    t.string   "telephone"
    t.string   "state"
    t.integer  "amount_cents", default: 0, null: false
    t.json     "payment"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["deposit_id"], name: "index_orders_on_deposit_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "alcohol_id"
    t.text     "description"
    t.integer  "brewery_id"
    t.integer  "region_id"
    t.string   "country"
    t.string   "capacity"
    t.integer  "kind_id"
    t.integer  "color_id"
    t.integer  "fermentation_id"
    t.float    "degree"
    t.integer  "specificity_id"
    t.boolean  "returnable"
    t.float    "promotion"
    t.integer  "rating"
    t.string   "sku"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "price_cents",     default: 0, null: false
    t.index ["alcohol_id"], name: "index_products_on_alcohol_id", using: :btree
    t.index ["brewery_id"], name: "index_products_on_brewery_id", using: :btree
    t.index ["color_id"], name: "index_products_on_color_id", using: :btree
    t.index ["fermentation_id"], name: "index_products_on_fermentation_id", using: :btree
    t.index ["kind_id"], name: "index_products_on_kind_id", using: :btree
    t.index ["region_id"], name: "index_products_on_region_id", using: :btree
    t.index ["specificity_id"], name: "index_products_on_specificity_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selections", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_selections_on_order_id", using: :btree
    t.index ["product_id"], name: "index_selections_on_product_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "specificities", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "deposit_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "received_at"
    t.integer  "taxe"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "buying_price_cents", default: 0, null: false
    t.index ["deposit_id"], name: "index_stocks_on_deposit_id", using: :btree
    t.index ["product_id"], name: "index_stocks_on_product_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "complement"
    t.string   "postal_code"
    t.string   "city"
    t.string   "country"
    t.string   "siret"
    t.string   "telephone"
    t.boolean  "admin",                  default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "orders", "deposits"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "alcohols"
  add_foreign_key "products", "breweries"
  add_foreign_key "products", "colors"
  add_foreign_key "products", "fermentations"
  add_foreign_key "products", "kinds"
  add_foreign_key "products", "regions"
  add_foreign_key "selections", "orders"
  add_foreign_key "selections", "products"
  add_foreign_key "stocks", "deposits"
  add_foreign_key "stocks", "products"
end
