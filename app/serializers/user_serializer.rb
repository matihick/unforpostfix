class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :enabled

  has_one :domain
end
