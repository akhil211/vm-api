class SectionsSerializer < ActiveModel::Serializer
  attributes :section_id, :section_name, :standard_name, :display

  def section_id
    object.id
  end

  def section_name
    object.title
  end

  def standard_name
  	object.standard.title.titleize
  end

end
