class DashboardsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized, only: [:userinformation, :new_patient, :last_patients, :searchresult]

  def patients
    @patients = policy_scope(Patient).paginate(page: params[:page], per_page: 10)
    last_patients
  end

  def new_patient
    @patient = Patient.new
  end

  def tickets
  end

  def userinformation
  end

  def searchresult
    @patients = policy_scope(Patient).paginate(page: params[:page], per_page: 10)
    last_patients
    @search = params["search"]
    @results = Patient.search(@search["searchedword"], hitsPerPage: 3)
  end

  private

  def last_patients
    @consultations = Consultation.all
    @unique_consulted_patients = @consultations.reverse.pluck(:patient_id).uniq.first(3)
    @last = []
    @unique_consulted_patients.each { |id| @last << Patient.find(id) }
    return @last
  end

end
