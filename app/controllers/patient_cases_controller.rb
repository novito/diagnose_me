class PatientCasesController < ApplicationController
  def index
    @patient_cases = current_user.patient_cases
  end

  def new
    @patient_case = current_user.patient_cases.new
  end

  def create
    @patient_case = current_user.patient_cases.new(patient_case_params)

    if @patient_case.save
      redirect_to patient_case_path(@patient_case), notice: 'Your case have been successfully submitted'
    end
  end

  def show
    @patient_case = current_user.patient_cases.find(params[:id])
  end

  private

  def patient_case_params
    params.require(:patient_case).permit(:comments, :tongue)
  end
end
