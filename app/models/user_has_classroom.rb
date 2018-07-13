class UserHasClassroom < ApplicationRecord
  belongs_to :user
  belongs_to :classroom
  belongs_to :user_type

end
