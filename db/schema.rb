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

ActiveRecord::Schema.define(version: 2019_12_17_051921) do

  create_table "booked_slots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "bid"
    t.bigint "organization_id"
    t.bigint "ad_space_agent_id"
    t.bigint "slot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ad_space_agent_id"], name: "index_booked_slots_on_ad_space_agent_id"
    t.index ["organization_id"], name: "index_booked_slots_on_organization_id"
    t.index ["slot_id"], name: "index_booked_slots_on_slot_id"
  end

  create_table "pre_booked_slots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "party_name"
    t.integer "price"
    t.integer "sold_amount"
    t.bigint "slot_id"
    t.bigint "ad_space_agent_id"
    t.index ["ad_space_agent_id"], name: "index_pre_booked_slots_on_ad_space_agent_id"
    t.index ["slot_id"], name: "index_pre_booked_slots_on_slot_id"
  end

  create_table "slots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "from"
    t.datetime "to"
    t.string "aasm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "type"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
