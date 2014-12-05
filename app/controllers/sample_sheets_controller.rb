class SampleSheetsController < ApplicationController
 
  before_action :set_sample_sheet, only: [:show, :edit, :update, :destroy]

  # GET /sample_sheets
  # GET /sample_sheets.json
  def index
    @search = SampleSheet.search do 
       fulltext params[:query_sample_sheet]
  end
  
  @sample_sheet= @search.results
  respond_to do |format|
    format.html
    format.json {    render :json => @sample_sheet.map(&:attributes) }
     
    
  end
  end

  # GET /sample_sheets/1
  # GET /sample_sheets/1.json
  def show
 end
 
 def sample_rows
 end

  # GET /sample_sheets/new
  def new
    @sample_sheet = SampleSheet.new
    @sample_sheet.sample_rows.build
        
  end

  # GET /sample_sheets/1/edit
  def edit
  end

  # POST /sample_sheets
  # POST /sample_sheets.json
  def create
 @sample_sheet = SampleSheet.new(sample_sheet_params)
    @sample_sheet.sample_rows.build
 
    respond_to do |format|
      if @sample_sheet.save
        format.html { redirect_to @sample_sheet, notice: 'Rna form was successfully created.' }
        format.json { render :show, status: :created, location: @sample_sheet }
      else
        format.html { render :new }
        format.json { render json: @sample_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sample_sheets/1
  # PATCH/PUT /sample_sheets/1.json
  def update
  
    respond_to do |format|
      if @sample_sheet.update(sample_sheet_params)
        format.html { redirect_to @sample_sheet, notice: 'sample_sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @sample_sheet }
      else
        format.html { render :edit }
        format.json { render json: @sample_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_sheets/1
  # DELETE /sample_sheets/1.json
  def destroy
      @sample_sheet = SampleSheet.find(params[:id])
    @sample_sheet.destroy
    respond_to do |format|
      format.html { redirect_to sample_sheets_path, notice: 'form successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_sheet
      @sample_sheet = SampleSheet.find(params[:id])
    end
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_sheet_params
      params.require(:sample_sheet).permit(:id, :fcid, sample_rows_attributes: [:id, :sampleId, :sampleRef, :index, :description, :control, :lane, :receipe, :operator, :sampleProject, :_destroy],
      :experiment_ids => [])    
      end
end
