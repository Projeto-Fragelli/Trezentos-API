class GradeSerializer < ActiveModel::Serializer
  attributes :id, :grade

  has_one :user
  has_one :exam
  has_one :grade_type
end
