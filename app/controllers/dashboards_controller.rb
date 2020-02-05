class DashboardsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def home
  end

  def userinformation
  end

end
