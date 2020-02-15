class TicketsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!
  before_action :set_patient, only: [:index, :new, :create]
  before_action :set_consultation, only: [:index, :new, :create]
  skip_after_action :verify_policy_scoped

  def index
    @tickets = @consultation.tickets
  end

  def new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    authorize @ticket
    @ticket.consultation = @patient
    @ticket.save
  end

  def show
  end


  private
  def set_consultation
    @consultation = Consultation.find(params[:id])
    @patient = Patient.find(@consultation.patient_id)
  end

end
