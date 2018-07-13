class UserHasGroupSerializer < ActiveModel::Serializer
  attributes :id, :helper

  has_one :user
  has_one :group
end
