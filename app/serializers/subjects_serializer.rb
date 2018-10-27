class SubjectsSerializer < ActiveModel::Serializer
  attributes :id, :title, :color_code, :homework_allotment_flag

  def homework_allotment_flag
    object.homework_alloted?
  end

  def title
    object.title.titleize
  end

end
