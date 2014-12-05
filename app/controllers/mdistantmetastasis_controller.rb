class MdistantmetastasisController < ApplicationController
  before_action :set_mdistantmetastasi, only: [:show, :edit, :update, :destroy]

  # GET /mdistantmetastasis
  # GET /mdistantmetastasis.json
  def index
    @mdistantmetastasis = Mdistantmetastasi.all
  end

  # GET /mdistantmetastasis/1
  # GET /mdistantmetastasis/1.json
  def show
  end

  # GET /mdistantmetastasis/new
  def new
    @mdistantmetastasi = Mdistantmetastasi.new
  end

  # GET /mdistantmetastasis/1/edit
  def edit
  end

  # POST /mdistantmetastasis
  # POST /mdistantmetastasis.json
  def create
    @mdistantmetastasi = Mdistantmetastasi.new(mdistantmetastasi_params)

    respond_to do |format|
      if @mdistantmetastasi.save
        format.html { redirect_to @mdistantmetastasi, notice: 'Mdistantmetastasi was successfully created.' }
        format.json { render :show, status: :created, location: @mdistantmetastasi }
      else
        format.html { render :new }
        format.json { render json: @mdistantmetastasi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdistantmetastasis/1
  # PATCH/PUT /mdistantmetastasis/1.json
  def update
    respond_to do |format|
      if @mdistantmetastasi.update(mdistantmetastasi_params)
        format.html { redirect_to @mdistantmetastasi, notice: 'Mdistantmetastasi was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdistantmetastasi }
      else
        format.html { render :edit }
        format.json { render json: @mdistantmetastasi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdistantmetastasis/1
  # DELETE /mdistantmetastasis/1.json
  def destroy
    @mdistantmetastasi.destroy
    respond_to do |format|
      format.html { redirect_to mdistantmetastasis_url, notice: 'Mdistantmetastasi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdistantmetastasi
      @mdistantmetastasi = Mdistantmetastasi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdistantmetastasi_params
      params.require(:mdistantmetastasi).permit(:id, :name)
    end
end
