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

ActiveRecord::Schema.define(version: 2020_11_22_162216) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "behavioral_markers", force: :cascade do |t|
    t.string "marker"
    t.bigint "competency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competency_id"], name: "index_behavioral_markers_on_competency_id"
  end

  create_table "centers", force: :cascade do |t|
    t.string "name"
    t.bigint "competency_model_id", null: false
    t.bigint "storyline_id", null: false
    t.index ["competency_model_id"], name: "index_centers_on_competency_model_id"
    t.index ["storyline_id"], name: "index_centers_on_storyline_id"
  end

  create_table "competencies", force: :cascade do |t|
    t.string "name"
    t.bigint "competency_model_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competency_model_id"], name: "index_competencies_on_competency_model_id"
  end

  create_table "competency_models", force: :cascade do |t|
    t.string "name"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.bigint "storyline_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["storyline_id"], name: "index_exercises_on_storyline_id"
  end

  create_table "storylines", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "behavioral_markers", "competencies"
  add_foreign_key "centers", "competency_models"
  add_foreign_key "centers", "storylines"
  add_foreign_key "competencies", "competency_models"
  add_foreign_key "exercises", "storylines"
end
