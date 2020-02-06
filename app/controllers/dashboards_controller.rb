class DashboardsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  skip_after_action :verify_authorized, only: :userinformation

  def home
    @patients = policy_scope(Patient)
    # Patient.all

  end

  def userinformation
  end

end
