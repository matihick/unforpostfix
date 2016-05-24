class AliasSerializer < ActiveModel::Serializer
  attributes :id, :name, :from, :recipients, :enabled
end
