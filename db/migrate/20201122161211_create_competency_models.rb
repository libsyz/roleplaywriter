class CreateCompetencyModels < ActiveRecord::Migration[6.0]
  def change
    create_table :competency_models do |t|
      t.string :name
    end
  end
end
