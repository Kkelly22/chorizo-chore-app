class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :description, :point_value, :household_name
  belongs_to :household
end
