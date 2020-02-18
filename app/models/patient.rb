class Patient < ApplicationRecord
  include AlgoliaSearch
  
  has_many :consultations, dependent: :destroy
  after_touch :index!
  has_many :glucose_levels, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthdate, presence: true
  validates :gender, presence: true


  algoliasearch do
    attributes :first_name, :last_name
    attribute :full_name
    attribute :age 
    attribute :last_consultation do
      { date: (consultations.last.created_at.strftime('%Y-%m-%d') unless consultations.last.nil?) }
    end

    searchableAttributes ['first_name', 'last_name', 'full_name', 'age','unordered(last_consultation)']
    customRanking ['desc(last_name)']
  end

  def age
    dob = self[:birthdate]
    now = Time.now.utc.to_date
    result = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    return result
  end

  def full_name
    "#{first_name}.capitalize! #{last_name}.capitalize!"
  end
end
