class Api::V1::SectionsController < Api::V1::BaseController

  before_action :set_section

  def subjects
    subjects = obj_array(@section.subjects, 'SubjectsSerializer')
    render_success({subjects: subjects})
  end

  def students
    students = obj_array(@section.students, 'Principal::StudentsSerializer')
    render_success({students: students})
  end

  private

  def set_section
    @section = Section.find_by(id: params[:id])
    render_error('Section not found') and return unless @section.present?
  end

end
