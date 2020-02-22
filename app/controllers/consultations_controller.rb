class ConsultationsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!
  before_action :set_patient, only: [:index, :new, :create, :new_ticket]
  before_action :set_consultation, only: [:show]
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    @consultations = @patient.consultations
    @ticket = Ticket.new
  end
  
  def new
    @consultation = Consultation.new
    authorize @consultation
  end

  def create
    @consultation = Consultation.new(consultation_params)
    authorize @consultation
    @consultation.patient = @patient
    @consultation.save
    redirect_to consultation_path(@consultation)
  end

  def show
    authorize @consultation
  end

  private

  def consultation_params
    params.require(:consultation).permit(:height, :weight, :report)
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_consultation
    @consultation = Consultation.find(params[:id])
    @patient = Patient.find(@consultation.patient_id)
  end

end
