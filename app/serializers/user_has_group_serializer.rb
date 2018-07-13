class UserHasGroupSerializer < ActiveModel::Serializer
  attributes :id, :helper, :grade

  has_one :user
  has_one :group
end
