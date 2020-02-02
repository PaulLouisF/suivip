class GlucoseLevel < ApplicationRecord
  belongs_to :patient
  validates :measured_at, presence: true
  validates :glucose_level, presence: true
end
