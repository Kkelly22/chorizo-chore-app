class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :description, :point_value
  belongs_to :household
end
