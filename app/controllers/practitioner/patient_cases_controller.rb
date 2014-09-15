class Practitioner::PatientCasesController < Practitioner::PractitionerController
  def index
    @patient_cases = PatientCase.all
  end

  def show
    @patient_case = PatientCase.find(params[:id])
  end
end
