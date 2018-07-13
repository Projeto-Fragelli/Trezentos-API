class ExamSerializer < ActiveModel::Serializer
  attributes :id, :description

  has_one :classroom
end
