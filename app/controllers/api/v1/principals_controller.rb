class Api::V1::PrincipalsController < Api::V1::BaseController

	before_action :set_standard, only: [:per_section_students]

	def dashboard
		render_success(Principal::DashboardSerializer.new(current_user))
	end

	def per_class_students
		standards = obj_array(current_user.school.standards, 'Principal::StandardsSerializer')
    	render_success(standards)
	end

	def per_section_students
		sections = obj_array(@standard.sections, 'Principal::SectionsSerializer')
    	render_success(sections)
	end

	def app_download_stats
    	render_success(Principal::StatsSerializer.new(current_user))
	end

	private

	def set_standard
		@standard = Standard.find_by(id: params[:standard_id])
		render_error('Standard not found') and return unless @standard.present?
	end

 end