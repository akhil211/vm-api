class Api::V1::AlertsController < Api::V1::BaseController

  def index
    events = obj_array(@current_user.alerts, 'ExamGroupSerializer')
    render_success({events: events})
  end

end
