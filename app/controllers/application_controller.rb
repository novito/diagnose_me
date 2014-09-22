class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || decide_after_sign_in(resource)
  end

  private

  def decide_after_sign_in(user)
    return practitioner_patient_cases_path if user.is_practitioner
    user.patient_cases.empty? ? new_patient_case_path : patient_cases_path
  end
end
