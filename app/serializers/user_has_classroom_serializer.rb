class UserHasClassroomSerializer < ActiveModel::Serializer
  attributes :id

  has_one :user
  has_one :classroom
  has_one :user_type
end
