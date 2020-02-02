class Consultation < ApplicationRecord
  belongs_to :patient
  has_many :user_consultations
  has_many :users, through: :user_consultations
  validates :report, presence: true
end
