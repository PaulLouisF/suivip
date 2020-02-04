class DashboardsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def home
    # @current_user = current_user
  end

  def userinformation
  end

end
