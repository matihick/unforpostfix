class SenderBccSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :enabled
end
