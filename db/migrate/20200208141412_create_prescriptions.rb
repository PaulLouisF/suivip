class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :medicine_name
      t.integer :dose_morning
      t.integer :dose_noon
      t.integer :dose_night
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
