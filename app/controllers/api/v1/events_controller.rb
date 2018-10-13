class Api::V1::EventsController < Api::V1::BaseController

  before_action :set_school, only: [:index]

  def index
    events = obj_array(@school.events, 'EventsSerializer')
    render_success({events: events})
  end

end
