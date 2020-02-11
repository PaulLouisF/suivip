class Patient < ApplicationRecord
  has_many :consultations
  has_many :glucose_levels, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :gender, presence: true
end
