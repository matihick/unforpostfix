class RecipientBccSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :enabled
end
