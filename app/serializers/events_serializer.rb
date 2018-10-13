class EventsSerializer < ActiveModel::Serializer
  attributes :title, :description, :starts_at, :ends_at
end
