class PictureSerializer < ActiveModel::Serializer
  attributes :id, :album_id, :name, :image_name, :url

  def image_name
    object.file_file_name
  end

  def url
    object.try(:url)
  end
end
