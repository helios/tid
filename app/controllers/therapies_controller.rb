class TherapiesController < ApplicationController

def new
  @patient = Patient.find(params[:patient_id])
  #@therapy = @patient.therapies.build
end

def create
  
   @patient = Patient.find(params[:patient_id])
   @therapy = @patient.therapies.build(params[:therapy])
  # @therapy = @patient.therapies.new(params[:therapy])
   # @therapy = @patient.therapies.build(params[:therapy]) 
   
  redirect_to @patient, :notice => "therapy created"
   
   #@therapies = @patient.therapies.build
   #@patient.therapies = Therapy.new(params[:therapy_id].to_h)
   #@patient.therapies << @therapy
   # @therapy = @patient.therapies.new(params[:therapy].to_h)
   # redirect_to @patient, :notice => "therapy created!"  
    
    #redirect_to patient_path(@patient)
   
    #format.html { redirect_to [@patient, @therapy], notice: 'Therapy was successfully created.' }
    #redirect_to @patient, :notice => "Therapy created!"  
  end
  
  
private
def therapy_params
      params.require(:therapy).permit(:id, :drug, :from, :to) 
    end
end
