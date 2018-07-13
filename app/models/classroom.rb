class Classroom < ApplicationRecord
  has_secure_password
  belongs_to :user
end
