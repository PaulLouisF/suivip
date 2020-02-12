class ConsultationsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @patient = Patient.find(params[:patient_id])
    @consultations = @patient.consultations
  end

  def new
  end

  def create
  end

end
