class CreateMatrices < ActiveRecord::Migration[6.0]
  def change
    create_table :matrices do |t|
      t.references :center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
