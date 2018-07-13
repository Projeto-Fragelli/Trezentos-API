class ClassroomSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :institution,
    :cut_off,
    :description,
    :created_at
    
    has_one :user
end
