class CreateGlucoseLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :glucose_levels do |t|
      t.date :measured_at
      t.integer :glucose_level
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
