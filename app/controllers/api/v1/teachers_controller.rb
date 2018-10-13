class Api::V1::TeachersController < Api::V1::BaseController

  before_action :set_teacher

  def classes
    standards = obj_array(@teacher.standards, 'StandardsSerializer')
    render_success(standards)
  end

  private

  def set_teacher
    @teacher = Teacher.find_by(id: params[:id])
    render_error('Teacher not found') and return unless @teacher.present?
  end

end
