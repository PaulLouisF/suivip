class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_consultations
  has_many :consultations, through: :user_consultations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :specialist, presence: true
end
