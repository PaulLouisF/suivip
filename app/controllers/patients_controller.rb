class PatientsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  require 'date'

  def index
    @patients = policy_scope(Patient)
  end

  def new
    @patient = Patient.new
    # authorize @patient
  end

  def create
    @patient = Patient.new(patient_params)
    authorize @patient
    @patient.save
    redirect_to mypatients_path
  end

  def show
  end

  def edit
  end

  def update
    @patient.update(patient_params)

    redirect_to patient_path(@patient)
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
    authorize @patient
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :birthdate, :gender, :address, :phone_number, :city)
  end
end
