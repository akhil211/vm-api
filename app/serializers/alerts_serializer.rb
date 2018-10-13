class AlertsSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :message, :is_read
end
