class Ticket < ApplicationRecord
  belongs_to: consultation
  validates :question, presence: true
  # validates :asking_user_id , presence: true
end
