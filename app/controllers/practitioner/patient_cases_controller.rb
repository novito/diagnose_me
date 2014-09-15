class Practitioner::PatientCasesController < Practitioner::PractitionerController
  def index
    @patient_cases = PatientCase.all
  end
end
