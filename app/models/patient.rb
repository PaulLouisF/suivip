class Patient < ApplicationRecord
  has_many :consultations
  has_many :glucose_levels, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :gender, presence: true

  def age
    dob = self[:birthdate]
    now = Time.now.utc.to_date
    result = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    return result
  end
end
