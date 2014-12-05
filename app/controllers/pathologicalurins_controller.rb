class PathologicalurinsController < ApplicationController
  
def create
    @patient = MicrornaPatient.find(params[:microrna_patient_id])
    @pathologicalurin = @patient.pathologicalurins.create!(pathologiclaurin_params)
    redirect_to @patient, :notice => "Esame urine creato"  
  end
  
private
def pathologicalurin_params
      params.require(:pathologicalurin).permit(:id, :proteinuria, :creatinuria, :ematuria, :date)
    end
end
