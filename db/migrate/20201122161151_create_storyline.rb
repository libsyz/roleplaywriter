class CreateStoryline < ActiveRecord::Migration[6.0]
  def change
    create_table :storylines do |t|
      t.string :name
    end
  end
end
