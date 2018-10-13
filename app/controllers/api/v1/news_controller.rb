class Api::V1::NewsController < Api::V1::BaseController

  before_action :set_school, only: [:index]

  def index
    news = obj_array(@school.news, 'NewsSerializer')
    render_success({school_bulletin: news})
  end

end
