class CreateCompetencySlots < ActiveRecord::Migration[6.0]
  def change
    create_table :competency_slots do |t|
      t.references :exercise_slot, null: false, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
