class FirstclassificationsController < ApplicationController
  before_action :set_firstclassification, only: [:show, :edit, :update, :destroy]

  # GET /firstclassifications
  # GET /firstclassifications.json
  def index
     @search = Sunspot.search Firstclassification, Secondclassification do
    fulltext params[:query_classification]
   end

  @classifications = @search.results
  respond_to do |format|
    format.html
    format.json {    render :json => @classifications.map(&:attributes) }
  end
end 


  # GET /firstclassifications/1
  # GET /firstclassifications/1.json
  def show
  end


  # GET /firstclassifications/new
  def new
    @firstclassification = Firstclassification.new
  end

  # GET /firstclassifications/1/edit
  def edit
  end

  # POST /firstclassifications
  # POST /firstclassifications.json
  def create
    @firstclassification = Firstclassification.new(firstclassification_params)
   @firstclassification.secondclassifications.build

    respond_to do |format|
      if @firstclassification.save
        format.html { redirect_to @firstclassification, notice: 'Firstclassification was successfully created.' }
        format.json { render :show, status: :created, location: @firstclassification }
      else
        format.html { render :new }
        format.json { render json: @firstclassification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firstclassifications/1
  # PATCH/PUT /firstclassifications/1.json
  def update
    respond_to do |format|
      if @firstclassification.update(firstclassification_params)
        format.html { redirect_to @firstclassification, notice: 'Firstclassification was successfully updated.' }
        format.json { render :show, status: :ok, location: @firstclassification }
      else
        format.html { render :edit }
        format.json { render json: @firstclassification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firstclassifications/1
  # DELETE /firstclassifications/1.json
  def destroy
    @firstclassification.destroy
    respond_to do |format|
      format.html { redirect_to firstclassifications_url, notice: 'Firstclassification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  


  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firstclassification
     
      @firstclassification = Firstclassification.find(params[:id])
      end 
     
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def firstclassification_params
      params.require(:firstclassification).permit(:id, :name, secondclassifications_attributes: [:id, :name, :_destroy])
    end
end
