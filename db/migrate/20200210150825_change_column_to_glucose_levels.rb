class ChangeColumnToGlucoseLevels < ActiveRecord::Migration[5.2]
  def change
    change_column :glucose_levels, :measured_at, :datetime
  end
end
