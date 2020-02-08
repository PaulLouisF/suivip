class AddConsultationsToPrescriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :prescriptions, :consultation, foreign_key: true
  end
end
