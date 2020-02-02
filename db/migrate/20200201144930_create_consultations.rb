class CreateConsultations < ActiveRecord::Migration[5.2]
  def change
    create_table :consultations do |t|
      t.integer :height
      t.integer :weight
      t.float :systolic_blood_pressure
      t.float :diastolic_blood_pressure
      t.text :report
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
