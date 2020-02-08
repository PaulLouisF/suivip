class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show,:edit, :update, :destroy]
  before_action :set_consultation, only: [:new, :create]
  def new
    # @consultation = Consultation.find(params[:consultation_id])
    @prescription = Prescription.new
    authorize @prescription
  end

  def create
    @prescription = Prescription.new
    # @consultation = Consultation.find[params[:consultation_id]]
    authorize @prescription
    @prescription.consultation = @consultation
    @consultation.save
    redirect_to consultation_path(@consultation)

  end

  def update
    @prescriptions = Prescription.find(params[:id])
    authorize @prescription
    if @prescription.update(prescription_params)
      redirect_to @prescription
    else
      render :edit
    end
  end

  def destroy
    #@prescription = Prescription.find(params[:id])
    authorize @prescription
    @prescription.destroy
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:id])
    authorize @prescription
  end

  def set_consultation
    @consultation = Consultation.find(params[:consultation_id])
  end


  def prescription_params
    params.require(:prescription).permit(:medicine_name, :dose_morning, :dose_noon, :dose_night)
  end
end
