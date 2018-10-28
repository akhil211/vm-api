class Principal::TeachersSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :photo_content_type, :photo_file_name

  def photo_content_type
  	object.image.try(:file_content_type)
  end

  def photo_file_name
  	object.image.try(:url)
  end

 end