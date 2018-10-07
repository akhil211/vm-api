class ExamGroupSerializer < ActiveModel::Serializer
  attributes :id, :title, :display_type, :color_code

  def display_type
    object.display_type.humanize.titleize
  end

end
