class CreateCenter < ActiveRecord::Migration[6.0]
  def change
    create_table :centers do |t|
      t.string :name
      t.references :competency_model, null: false, foreign_key: true
      t.references :storyline, null: false, foreign_key: true
    end
  end
end
