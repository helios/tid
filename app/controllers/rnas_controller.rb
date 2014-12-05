class RnasController < ApplicationController
  before_action :set_rna, only: [:show, :edit, :update, :destroy]

  # GET /rnas
  # GET /rnas.json
  def index
    @rnas = Rna.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @docs }
    end
  end
  
  

  # GET /rnas/1
  # GET /rnas/1.json
  def show
    
  end

  # GET /rnas/new
  def new
    @rna = Rna.new
  end

  # GET /rnas/1/edit
  def edit
  end

  # POST /rnas
  # POST /rnas.json
  def create
    @rna = Rna.new(rna_params)

    respond_to do |format|
      if @rna.save
        format.html { redirect_to @rna, notice: 'rna was successfully created.' }
        format.json { render :show, status: :created, location: @rna }
      else
        format.html { render :new }
        format.json { render json: @rna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rnas/1
  # PATCH/PUT /rnas/1.json
  def update
    respond_to do |format|
      if @rna.update(rna_params)
        format.html { redirect_to @rna, notice: 'rna was successfully updated.' }
        format.json { render :show, status: :ok, location: @rna }
      else
        format.html { render :edit }
        format.json { render json: @rna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rnas/1
  # DELETE /rnas/1.json
  def destroy
    @rna.destroy
    respond_to do |format|
      format.html { redirect_to rnas_url, notice: 'rna was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rna
      @rna = Rna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rna_params
      params.require(:rna).permit(:date, :comment, :doc)
    end
end
