class Consultation < ApplicationRecord
  belongs_to :patient
  has_many :user_consultations
  has_many :users, through: :user_consultations
  has_many :tickets
  validates :report, presence: true
  has_one :prescription, dependent: :destroy
end
