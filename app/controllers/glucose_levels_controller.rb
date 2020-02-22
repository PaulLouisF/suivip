class GlucoseLevelsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!

  skip_after_action :verify_policy_scoped, only: :index

  def index
    @patient = Patient.find(params[:patient_id])
    @glycemic_value = prep_glycemic_value
  end

  def prep_glycemic_value
    @patient.glucose_levels.map do |glucose_level| {
      x: glucose_level.measured_at.strftime('%Y-%m-%d %H:%M'),
      y: glucose_level.glucose_level }
    end
  end
end