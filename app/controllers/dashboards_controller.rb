class DashboardsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def home
    @patients = Patient.all
  end

  def userinformation
  end

end
