class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :enabled
end
