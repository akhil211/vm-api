module Responder

  def render_success(data={}, message=nil)
    render json: { success: true, message: message, data: data }, status: 200
  end

  def render_unauthorized
    render json: {success: false, message: 'Unauthorized'}, status: 401
  end

  def render_error(message, data={})
    render json: { success: false, data: data, message: message }, status: 200
  end

end
