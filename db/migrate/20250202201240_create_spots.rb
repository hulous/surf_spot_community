class CreateSpots < ActiveRecord::Migration[8.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.decimal :latitude
      t.decimal :longitude
      t.string :wave_size
      t.string :difficulty
      t.string :best_season
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
