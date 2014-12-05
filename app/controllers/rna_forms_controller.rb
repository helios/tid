class RnaFormsController < ApplicationController
  before_action :set_rna_form, only: [:show, :edit, :update, :destroy]

  # GET /rna_forms
  # GET /rna_forms.json


  

    def index
    @search = RnaForm.search do
    fulltext params[:query_rnaId]
  end
  
  @rna_forms = @search.results
  respond_to do |format|
    format.html
    format.json {    render :json => @rna_forms.map(&:attributes) }
  end
  end 


  # GET /rna_forms/1
  # GET /rna_forms/1.json
  def show
     
         
  end
 

  # GET /rna_forms/new
  def new
    
    @rna_form = RnaForm.new
   
  end

  # GET /rna_forms/1/edit
  def edit
  end

  # POST /rna_forms
  # POST /rna_forms.json
  def create
   
 @rna_form = RnaForm.new(rna_form_params)
    @rna_form.rins.build
    respond_to do |format|
      if @rna_form.save
        format.html { redirect_to @rna_form, notice: 'Rna form was successfully created.' }
        format.json { render :show, status: :created, location: @rna_form }
      else
        format.html { render :new }
        format.json { render json: @rna_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rna_forms/1
  # PATCH/PUT /rna_forms/1.json
  def update
  
    respond_to do |format|
      if @rna_form.update(rna_form_params)
        format.html { redirect_to @rna_form, notice: 'rna_form was successfully updated.' }
        format.json { render :show, status: :ok, location: @rna_form }
      else
        format.html { render :edit }
        format.json { render json: @rna_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rna_forms/1
  # DELETE /rna_forms/1.json
def destroy
      @rna_form = RnaForm.find(params[:id])
    @rna_form.destroy
    respond_to do |format|
      format.html { redirect_to rna_forms_path, notice: 'form successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rna_form
     @rna_form = RnaForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rna_form_params
      params.require(:rna_form).permit(:id, :sortingDate, :noCells, :cell_id, :cell_label, :noAliquots, :cellsPerAliquot, :purity, :volBufferPerAliquot, :noAliquotsRnaIsolation, :rnaIsolationDate, 
      :rnaId, :volDilution,  :rnaConc, :totalCells, :ngTotal, :ngUsed, :ngavailable, :ngRemaining, :operator, :sampleIndex, :sampleId, :_destroy, rins_attributes: [:id, :measure, :date, :_destroy],
      experiments_ids: [ ], experiments_attributes: [:_id])
    end
end



