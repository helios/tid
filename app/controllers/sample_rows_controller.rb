class SampleRowsController < ApplicationController
 
  before_action :set_sample_row, only: [:show, :edit, :update, :destroy]

  # GET /sample_sheets
  # GET /sample_sheets.json
  def index
     @sample_sheet = SampleSheet.find(params[:sample_sheet_id])
     @sample_rows = @sample_sheet.sample_rows.all
      
        respond_to do |format|
    format.html
    format.json {    render :json => @sample_sheet.sample_rows.map(&:attributes) }
     format.csv {  send_data @sample_rows.to_csv, :filename => 'sample_sheet.csv'     }
    
  end
  end 
  
  def sample_rows_all
     @sample_sheets = SampleSheet.all
     @sample_rows = Array.new
     @sample_sheets.each do |sample_sheet|
      sample_sheet.sample_rows.each do |row|
        @sample_rows << row 
     end
     end
        respond_to do |format|
    format.html
    format.json {    render :json => @sample_rows.map(&:attributes) }  
  end
end

      


  # GET /sample_sheets/1
  # GET /sample_sheets/1.json
  def show
end 

  # GET /sample_sheets/new
  def new
     @run = Run.find(params[:run_id])
     @sample_sheet = @run.sampleSheets.find(params[:sample_sheet_id])
    
    @sample_row = @sample_sheet.build(params[:sample_row])
  end

  # GET /sample_sheets/1/edit
  def edit
  end

  # POST /sample_sheets
  # POST /sample_sheets.json
  def create
     @run = Run.find(params[:run_id])
      @sample_sheet = @run.sampleSheets.find(params[:sample_sheet_id])
    
 @sample_row = @sample_sheet.build(params[:sample_row])
   

    respond_to do |format|
      if @sample_row.save
        format.html { redirect_to @sample_row }
        format.json { render :show, status: :created, location: @sample_row }
      else
        format.html { render :new }
        format.json { render json: @sample_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sample_sheets/1
  # PATCH/PUT /sample_sheets/1.json
  def update
  
    respond_to do |format|
      if @sample_row.update(sample_row_params)
        format.html { redirect_to @sample_row, notice: '' }
        format.json { render :show, status: :ok, location: @sample_row }
      else
        format.html { render :edit }
        format.json { render json: @sample_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_sheets/1
  # DELETE /sample_sheets/1.json
  def destroy
    @run = Run.find(params[:run_id])
     @sample_sheet = @run.sampleSheets.find(params[:sample_sheet_id])
    
    @sample_row = @sample_sheet.find(params[:id])
    @sample_row.destroy
    respond_to do |format|
      format.html { redirect_to run_path(@run), notice: 'form successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_row_params
      params.require(:sample_row).permit(:id, :fcid, :lane, :sampleId, :sampleRef, :index, :description, :control, :receipe, :operator, :sampleProject)
    end
end
