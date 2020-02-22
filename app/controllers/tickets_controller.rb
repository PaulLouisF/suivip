class TicketsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!
  before_action :set_consultation, only: [:index, :new, :create]
  before_action :set_patient, only: [:index, :new, :create]
  skip_after_action :verify_policy_scoped

  def index
    @tickets = @consultation.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    authorize @ticket
    # @consultation = patient.consultations.last
    @ticket.consultation = @patient.consultations.last
    @ticket.asking_user_id = current_user.id
    @ticket.save
    redirect_to patient_consultations_path(@patient)

  end

  
  private

  def auto_response
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
  
  def set_consultation
    @consultation = Consultation.all.last
    @patient = Patient.find(@consultation.patient_id)
  end

  def ticket_params
    params.require(:ticket).permit(:question)
  end
end
