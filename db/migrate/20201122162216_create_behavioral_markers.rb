class CreateBehavioralMarkers < ActiveRecord::Migration[6.0]
  def change
    create_table :behavioral_markers do |t|
      t.string :marker
      t.references :competency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
