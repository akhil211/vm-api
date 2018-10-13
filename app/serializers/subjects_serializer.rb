class SubjectsSerializer < ActiveModel::Serializer
  attributes :id, :title, :color_code, :homework_allotment_flag

  def homework_allotment_flag
    'no'
  end

  def title
    object.title.titleize
  end

end
