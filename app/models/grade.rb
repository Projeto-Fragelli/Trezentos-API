class Grade < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  belongs_to :grade_type

end
