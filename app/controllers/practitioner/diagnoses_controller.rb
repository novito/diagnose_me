class Practitioner::DiagnosesController < Practitioner::PractitionerController
  def new
    @patient_case = PatientCase.find_by(id: params[:patient_case_id])
    @diagnosis = @patient_case.diagnoses.new unless @patient_case.nil?
  end

  def create
    @patient_case = PatientCase.find_by(id: params[:patient_case_id])
    @diagnosis = @patient_case.diagnoses.new(diagnosis_params)

    if @diagnosis.save
      redirect_to practitioner_patient_case_path(@patient_case), notice: 'Diagnose has been added correctly'
    else
      render :new
    end
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(:comments).merge(practitioner_id: current_user.id)
  end
end
