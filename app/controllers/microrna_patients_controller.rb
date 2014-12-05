class MicrornaPatientsController < ApplicationController
  before_action :set_microrna_patient, only: [:show, :edit, :update, :destroy]

  # GET /microrna_patients
  # GET /microrna_patients.json
  def index
    @search = MicrornaPatient.search do
     fulltext params[:query_microrna_patient]
  end
  
  @microrna_patients = @search.results
  
  
  respond_to do |format|
    format.html
    format.json {    render :json => @microrna_patients.map(&:attributes) }
  end
end

  # GET /microrna_patients/1
  # GET /microrna_patients/1.json
  def show
  end

  # GET /microrna_patients/new
  def new
    @microrna_patient = MicrornaPatient.new
    @microrna_patient.pathologicalurins.build
    @microrna_patient.stickurins.build
  end

  # GET /microrna_patients/1/edit
  def edit
  end

  # POST /microrna_patients
  # POST /microrna_patients.json
  def create
    @microrna_patient = MicrornaPatient.new(microrna_patient_params)
    generate_code
    respond_to do |format|
      if @microrna_patient.save 
          format.html { render :show}
        #format.json { render :show, status: :created, location: @microrna_patient }
      else
        format.html { render :new }
        format.json { render json: @microrna_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /microrna_patients/1
  # PATCH/PUT /microrna_patients/1.json
  def update
    respond_to do |format|
      if @microrna_patient.update(microrna_patient_params)
        format.html { redirect_to @microrna_patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @microrna_patient }
      else
        format.html { render :edit }
        format.json { render json: @microrna_patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microrna_patients/1
  # DELETE /microrna_patients/1.json
  def destroy
    @microrna_patient.destroy
    respond_to do |format|
      format.html { redirect_to microrna_patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_microrna_patient
      @microrna_patient = MicrornaPatient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def microrna_patient_params
      params.require(:microrna_patient).permit(:id, :idCode, :datebirth, :gender, :addpain, :artalgia, :artrite, :more, :urin, :stick, :microrna, :dna,
      pathologicalurins_attributes: [:id, :proteinuria, :creatinuria, :ratio, :ematuria, :date], 
      stickurins_attributes: [:id, :proteinuria, :ematuria, :date ])
    end
    
    def generate_code
     i = "00001"
     @microrna_patient.idCode = i.to_s[0..4]
     while MicrornaPatient.where(idCode: @microrna_patient.idCode).exists? do
       i = (i.to_i+1).to_s
      @microrna_patient.idCode = i 
  end
  end

end
