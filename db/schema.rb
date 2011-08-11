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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110810091124) do

  create_table "abilities", :force => true do |t|
    t.string   "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "effect"
    t.text     "effect_code"
  end

  create_table "card_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.string   "special_powers"
    t.string   "abilities"
    t.string   "strength"
    t.string   "resistence"
    t.string   "cost"
    t.integer  "rarity_id"
    t.integer  "expansion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
  end

  create_table "collection_cards", :force => true do |t|
    t.integer  "card_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deck_items", :force => true do |t|
    t.integer  "card_id"
    t.integer  "deck_id"
    t.integer  "quantity",   :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "decks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expansions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "powers", :force => true do |t|
    t.string   "name"
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "image_url"
    t.text     "signature"
    t.integer  "currency"
    t.text     "boosters"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "ualevel",         :default => 1
  end

end
