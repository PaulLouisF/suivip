class UserConsultation < ApplicationRecord
  belongs_to :user
  belongs_to :consultation
end
