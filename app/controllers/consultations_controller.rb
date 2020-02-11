class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:show,:edit, :update, :destroy]
  def index
    @consultations = Consultation.all
  end

  def new
    @consultation = Consultation.new
    authorize @consultation
  end

  def create
    @consultation = Consultation.new(consultation_params)
    authorize @consultation
    if @consultation.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @consultation.update(consultation_params)

    redirect_to patient_path(@consultation)
  end

  private
  
  def set_consultation
    @consultation = Consultation.find(params[:id])
  end

  def consultation_params
    params.require(:consultation).permit()
  end
end
