class Practitioner::PractitionerController < ApplicationController
  before_action :authenticate_practitioner!

  private

  def authenticate_practitioner!
    authenticate_user!

    unless current_user.is_practitioner
      redirect_to root_path, :alert => 'You are not authorized to see this page'
    end
  end
end
