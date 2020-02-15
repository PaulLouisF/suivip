class DashboardsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  skip_after_action :verify_authorized, only: :userinformation

  # def home
  #   @patients = policy_scope(Patient)
  #   @patient = Patient.new
  # end

  def patients
    @patients = policy_scope(Patient)
    @patient = Patient.new
  end

  def tickets
    @patients = policy_scope(Patient)
  end

  def userinformation
  end
end
