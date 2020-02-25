class GlucoseLevelsController < ApplicationController
  layout 'patient'
  before_action :authenticate_user!
  before_action :set_patient, only: [:index, :new, :create]

  skip_after_action :verify_policy_scoped, only: :index

  def index
    # @patient = Patient.find(params[:patient_id])
    @glycemic_value = prep_glycemic_value
    @glucose_level = GlucoseLevel.new
  end

  def new
    @glucose_level = GlucoseLevel.new
    authorize @glucose_level
  end

  def create
    @glucose_level = GlucoseLevel.new(glucose_level_params)
    authorize @glucose_level
    @glucose_level.patient = @patient
    if @glucose_level.save
      respond_to do |format|
        format.html { redirect_to patient_glucose_levels_path(@patient) }
        format.js  # <-- will render `app/views/glucose_levels/create.js.erb`
      end
    end
  end

  def prep_glycemic_value
    @patient.glucose_levels.map do |glucose_level| {
      x: glucose_level.measured_at.strftime('%Y-%m-%d %H:%M'),
      y: glucose_level.glucose_level }
    end
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  private

  def glucose_level_params
    params.require(:glucose_level).permit(:measured_at, :glucose_level)
  end
end
