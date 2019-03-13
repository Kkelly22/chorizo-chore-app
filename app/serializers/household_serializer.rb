class HouseholdSerializer < ActiveModel::Serializer
  attributes :id, :name, :address
  has_many :chores
end
