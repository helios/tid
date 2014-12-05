class PathologiesController < ApplicationController
  
def new
  @patient = Patient.find(params[:patient_id]) 
end

def create
    @patient = Patient.find(params[:patient_id])
   @therapy = @patient.pathologies.build(params[:therapy])
  end
  
  
private
def therapy_params
      params.require(:pathology).permit(:id, :name, :from, :to) 
    end

end