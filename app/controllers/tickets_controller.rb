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
    @ticket.consultation = @consultation
    @ticket.asking_user_id = current_user.id
    @ticket.save
    redirect_to patient_consultations_path(@patient)
  end

  def set_patient
    @patient = @consultation.patient
    authorize @patient
  end

  private

  def set_consultation
    @consultation = Consultation.find(params[:consultation_id])
    #@patient = Patient.find(@consultation.patient_id)
  end

  def ticket_params
    params.require(:ticket).permit(:question)
  end
end
