class DashboardsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  skip_after_action :verify_authorized, only: :userinformation

  def home
    @patients = policy_scope(Patient)
    @patient = Patient.new

    # @patient = PatientsController.new
    # @patient = PatientsController.create
  end

  def userinformation
  end

end
