class Api::V1::EventsController < Api::V1::BaseController

  def index
    events = obj_array(@current_user.school.events, 'ExamGroupSerializer')
    render_success({events: events})
  end

end
