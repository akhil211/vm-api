class Principal::SectionsSerializer < ActiveModel::Serializer
  attributes :id, :name, :student_count

  def name
  	object.name.titleize
  end

 end