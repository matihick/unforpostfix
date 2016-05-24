class AliasSerializer < ActiveModel::Serializer
  attributes :name, :from, :recipients, :enabled
end
