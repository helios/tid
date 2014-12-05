class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @search = Patient.search do 
       fulltext params[:query_patients]
  end
  
  @patients = @search.results
  respond_to do |format|
    format.html
    format.json {    render :json => @patients.map(&:attributes) }
  end
  end 


  # GET /patients/1
  # GET /patients/1.json
  def show
  end
  
  # GET /patients/new
  def new
    @patient = Patient.new
    @firstclassifications = Firstclassification.all
    @secondclassifications = Secondclassification.all
    @patient.therapies.build
    @patient.pathologies.build
    #@therapy = Therapy.new(patient_id: @patient.id)
  end

  # GET /patients/1/edit
  def edit
  @firstclassifications = Firstclassification.all
    @secondclassifications = Secondclassification.all
  end
  
  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params) 
   # @therapy = @patient.therapies.build
   # @patient.pathologies.build
    #@patient.is_a = "Observable entity"
    #@patient.ontology = "SNOMEDCT"

    respond_to do |format|
      if @patient.save
        #@patient.is_a = "Observable entity"
        format.html { redirect_to @patient }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update_attributes(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
    params.require(:patient).permit(:histology_number, :patient_id, :date_of_birth, :gender, :smoker, :date_of_biopsy, :distance, 
                                :grading, :nregionallymphnode,:firstclassification_id, :secondclassification_id,
                                  :tprimarytumor, :mdistantmetastasi, therapies_attributes: [:id, :drug, :from, :to, :_destroy],
                                  pathologies_attributes: [:id, :name, :from, :to, :_destroy]) 
                                 
    end
end
