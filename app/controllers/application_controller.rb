class ApplicationController < ActionController::API

  # Handle Rails 404 error with custom method
  #rescue_from ActiveRecord::RecordNotFound, with: :return_404_error

  # Handle Rails Bad Request error with custom method
  #rescue_from ActionController::ParameterMissing, with: :return_400_error

  # Handle Foreign key voilation error with custom json response
  # rescue_from ActiveRecord::InvalidForeignKey do
  #   render json: { success: false,
  #                  error: "This record can't be deleted as there are other records associated with it",
  #                  status_code: 404 }, status: :not_found
  # end

  protected

  # This method will return JSON error message with 404 status code when rails app
  # throw not found error.
  def return_404_error
    render json: { success: false, error: 'not found',
                   status_code: 404 }, status: :not_found
  end

  # This method will return JSON error message with 400 status code when rails app
  # throw bad request error.
  def return_400_error
    render json: { success: false, error: 'bad request',
                   status_code: 400 }, status: 400
  end

end
