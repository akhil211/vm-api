class Api::V1::ExamsController < Api::V1::BaseController

  before_action :set_student, only: [:index]
  before_action :set_exam_group, only: [:list]

  def index
    exam_groups = obj_array(@student.standard.exam_groups, 'ExamGroupSerializer')
    render_success({exam_groups: exam_groups})
  end

  def list
    exams = obj_array(@exam_group.exams, 'ExamSerializer')
    render_success({exams: exams})
  end

  private

  def set_student
    @student = Student.find_by(id: params[:student_id])
    render_error('Student not found') and return unless @student.present?
  end

  def set_exam_group
    @exam_group = ExamGroup.find_by(id: params[:id])
    render_error('Exam Group not found') and return unless @exam_group.present?
  end

end
