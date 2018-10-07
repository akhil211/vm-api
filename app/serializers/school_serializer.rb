class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :board, :logo

  # [:name, :address, :city, :state, :board].each do |attr|
  #   define_method attr do
  #     object.send(attr).try(:titleize)
  #   end
  # end

end
