class StandardsSerializer < ActiveModel::Serializer
  attributes :section_id, :section_name, :title, :display

  def section_id
    object.id
  end

  def display
    object.name
  end

end
