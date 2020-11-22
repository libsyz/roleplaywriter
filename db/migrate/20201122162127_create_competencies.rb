class CreateCompetencies < ActiveRecord::Migration[6.0]
  def change
    create_table :competencies do |t|
      t.string :name
      t.references :competency_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
