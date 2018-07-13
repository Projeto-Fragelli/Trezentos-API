class GroupSerializer < ActiveModel::Serializer
  attributes :id, :number

  has_one :exam
end
