class SchoolSerializer < ActiveModel::Serializer
  attributes School.column_names

  [:name, :address, :city, :state, :board].each do |attr|
    define_method attr do
      object.send(attr).try(:titleize)
    end
  end

end
