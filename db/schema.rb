# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160620161405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "centers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "breakfast"
    t.boolean  "am_snack"
    t.boolean  "lunch"
    t.boolean  "pm_snack"
    t.boolean  "supper"
    t.boolean  "late_snack"
  end

  create_table "children", force: :cascade do |t|
    t.string   "fname"
    t.string   "mname"
    t.string   "lname"
    t.string   "food_subsidy"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "group_id"
  end

  create_table "families", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "handoffs", force: :cascade do |t|
    t.string   "attend"
    t.integer  "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "child_id"
    t.string   "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "meal_type"
    t.integer  "teacher_id"
    t.datetime "meal_date"
    t.boolean  "breakfast"
    t.boolean  "am_snack"
    t.boolean  "lunch"
    t.boolean  "pm_snack"
    t.boolean  "supper"
    t.boolean  "late_snack"
  end

  create_table "parents", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "center_id"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
