class Api::V1::AlbumsController < Api::V1::BaseController

  before_action :set_school, only: [:index]
  before_action :set_album, only: [:pictures]

  def index
    albums = obj_array(@school.albums, 'AlbumSerializer')
    render_success(albums)
  end

  def pictures
    pictures = obj_array(@album.pictures, 'PictureSerializer')
    render_success(pictures)
  end

  private

  def set_album
    @album = Album.find_by(id: params[:id])
    render_error('Album not found') and return unless @album
  end

end
