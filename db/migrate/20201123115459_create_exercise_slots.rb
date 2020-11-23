class CreateExerciseSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_slots do |t|
      t.integer :number
      t.references :matrix, null: false, foreign_key: true

      t.timestamps
    end
  end
end
