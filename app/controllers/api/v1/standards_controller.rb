class Api::V1::StandardsController < Api::V1::BaseController

  before_action :set_standard

  def subjects
    subjects = obj_array(@standard.subjects, 'SubjectsSerializer')
    render_success({subjects: subjects})
  end

  private

  def set_standard
    @standard = Standard.find_by(id: params[:id])
    render_error('Standard not found') and return unless @standard.present?
  end

end
