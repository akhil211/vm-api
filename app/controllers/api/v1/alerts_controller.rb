class Api::V1::AlertsController < Api::V1::BaseController

  def index
    alerts = obj_array(@current_user.alerts, 'AlertsSerializer')
    render_success({alerts: alerts})
  end

end
