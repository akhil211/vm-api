class NewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :sticky, :link, :image_file_name, :created_at,
  :updated_at

  def image_file_name
    object.try(:attachment).try(:url)
  end

end
