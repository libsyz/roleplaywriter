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

ActiveRecord::Schema.define(version: 2020_11_23_115728) do

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

  create_table "competency_slots", force: :cascade do |t|
    t.bigint "exercise_slot_id", null: false
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_slot_id"], name: "index_competency_slots_on_exercise_slot_id"
  end

  create_table "exercise_slots", force: :cascade do |t|
    t.integer "number"
    t.bigint "matrix_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["matrix_id"], name: "index_exercise_slots_on_matrix_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.bigint "storyline_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["storyline_id"], name: "index_exercises_on_storyline_id"
  end

  create_table "matrices", force: :cascade do |t|
    t.bigint "center_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["center_id"], name: "index_matrices_on_center_id"
  end

  create_table "storylines", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "behavioral_markers", "competencies"
  add_foreign_key "centers", "competency_models"
  add_foreign_key "centers", "storylines"
  add_foreign_key "competencies", "competency_models"
  add_foreign_key "competency_slots", "exercise_slots"
  add_foreign_key "exercise_slots", "matrices"
  add_foreign_key "exercises", "storylines"
  add_foreign_key "matrices", "centers"
end
