class ConsultationsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!
  before_action :set_patient, only: [:index, :new, :create, :new_ticket]
  before_action :set_consultation, only: [:show]
  skip_after_action :verify_policy_scoped, only: [:index]

  def index
    @consultations = @patient.consultations
    @ticket = Ticket.new
    time_since_last_consultation
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
    
    @user_consultation = UserConsultation.new
    @user_consultation.user_id = current_user.id
    @user_consultation.consultation_id = @consultation.id
    @user_consultation.save
    redirect_to patient_consultations_path(@patient)
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

  def time_since_last_consultation
    if @consultations.empty?
      @time_since_last = ""
    else
      delta = (Time.now - @consultations.last.created_at)
      @time_since_last = delta.divmod(60*60*24).first
    end

    return @time_since_last
  end

end
