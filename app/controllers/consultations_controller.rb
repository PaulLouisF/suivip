class ConsultationsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    @patient = Patient.find(params[:patient_id])
    @consultations = @patient.consultations
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @consultation = Consultation.new
    authorize @consultation
  end

  def create
    @consultation = Consultation.new(consultation_params)
    authorize @consultation
    @patient = Patient.find(params[:patient_id])
    @consultation.patient = @patient
    @consultation.save
    redirect_to patient_consultations_path(@patient)
  end

  private

  def consultation_params
    params.require(:consultation).permit(:height, :weight, :report)
  end

end
