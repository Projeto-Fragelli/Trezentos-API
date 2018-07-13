class UserSerializer < ActiveModel::Serializer
  attributes :id,
  :first_name,
  :last_name,
  :email,
  :is_from_facebook,
  :telephone_ddi,
  :telephone_ddd,
  :telephone_number

end
