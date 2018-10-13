class Api::V1::NewsController < Api::V1::BaseController

  def index
    if params[:school_id].present?
      news = BulletinBoard.where(school_id: params[:school_id])
    else
      news = @current_user.try(:school).try(:news)
    end
    news = obj_array(news, 'ExamGroupSerializer')
    render_success({events: events})
  end

end
