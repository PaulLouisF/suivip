class PrescriptionsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!

  skip_after_action :verify_policy_scoped, only: :index

  def index
    @patient = Patient.find(params[:patient_id])
    @consultations = @patient.consultations
    @prescriptions = []

    @consultations.each do |consultation|
      next if consultation.prescription.nil?
      
      @prescriptions << consultation.prescription
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:medicine_name, :dose_morning, :dose_noon, :dose_night)
  end
end

