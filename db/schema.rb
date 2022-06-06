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

ActiveRecord::Schema[7.0].define(version: 2022_06_06_171312) do
  create_table "domains", force: :cascade do |t|
    t.string "name", null: false
    t.string "path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["path"], name: "index_domains_on_path", unique: true
  end

  create_table "expectations", force: :cascade do |t|
    t.string "path", null: false
    t.string "url_param"
    t.integer "domain_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "method", null: false
    t.index ["domain_id"], name: "index_expectations_on_domain_id"
    t.index ["path", "url_param", "domain_id"], name: "index_expectations_on_path_and_url_param_and_domain_id", unique: true
  end

  create_table "responses", force: :cascade do |t|
    t.string "body", null: false
    t.string "format", null: false
    t.integer "code", null: false
    t.integer "expectation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expectation_id"], name: "index_responses_on_expectation_id"
  end

  add_foreign_key "expectations", "domains"
  add_foreign_key "responses", "expectations"
end
