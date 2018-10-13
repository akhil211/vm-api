class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :name, :url

  def url
    object.image_url
  end

end
