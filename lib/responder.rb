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

  def render_array(array, serializer, message=nil)
    data = obj_array(array, serializer)
    render_success(data, message)
  end

  def obj_array(array, serializer)
    ActiveModel::ArraySerializer.new(array, each_serializer: serializer.constantize)
  end

end
