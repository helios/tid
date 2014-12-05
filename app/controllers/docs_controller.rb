class DocsController < ApplicationController


  before_action :set_doc, only: [:show, :edit, :update, :destroy]

  # GET /docs
  # GET /docs.json
  def index
     @search = Doc.search do
    fulltext params[:query_docs] 
    end
  @docs = @search.results
  respond_to do |format|
    format.html
    format.json {    render :json => @docs.map(&:attributes) }
  end
  end
  
 
  

  

  # GET /docs/1
  # GET /docs/1.json
  def show
   
  end

  # GET /docs/new
  def new
    #  @run = run.find(params[:run_id])
  @doc = Doc.new
  @file_type = FileType.all
  @sample_sheets = SampleSheet.all
  @rna_forms = RnaForm.all
  end

  # GET /docs/1/edit
  def edit
  end

  # POST /docs
  # POST /docs.json
 
 

 
  def create
     @doc = Doc.new(doc_params)
     @file_type = FileType.all
   @sample_sheets = SampleSheet.all
  # @docs.rna_forms = []
  @doc.rna_forms_ids.first.split(', ').each do |rna| 
  @rna_form =  RnaForm.where(rnaId: rna)
 
 end
    respond_to do |format|
      if @doc.save
        
        format.html { redirect_to @doc, notice: 'doc was successfully created.' }
        format.json { render :show, status: :created, location: @doc }
      else
        format.html { render :new }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end
  
  


  # PATCH/PUT /docs/1
  # PATCH/PUT /docs/1.json
  def update
    @file_type = FileType.all
  
    respond_to do |format|
      if @doc.update(doc_params)
        format.html { redirect_to @doc, notice: 'doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @doc }
      else
        format.html { render :edit }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
     
      @doc = Doc.find(params[:id])

    @doc.destroy
    respond_to do |format|
      format.html { redirect_to docs_path(), notice: 'doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc      
      @doc = Doc.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_params
      params.require(:doc).permit(:id, :researcher, :date, :date_only, :comment, :doc, :file_type_id, :file_type_label,:tags,
       rna_forms_ids: [ ] , rna_forms_labels: [ ],  sample_sheets_ids: [ ] , sample_sheets_fcid: [ ],
       samples: [ ]  ) 
    end
end
