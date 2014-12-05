class RinsController < ApplicationController
  before_action :set_rin, only: [:show, :edit, :update, :destroy]

  # GET /rins
  # GET /rins.json
  def index
    @rins = Rin.all
  end

  # GET /rins/1
  # GET /rins/1.json
  def show
  end

  # GET /rins/new
  def new
    @rin = Rin.new
  end

  # GET /rins/1/edit
  def edit
  end

  # POST /rins
  # POST /rins.json
  def create
    @rin = Rin.new(rin_params)

    respond_to do |format|
      if @rin.save
        format.html { redirect_to @rin, notice: 'Rin was successfully created.' }
        format.json { render :show, status: :created, location: @rin }
      else
        format.html { render :new }
        format.json { render json: @rin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rins/1
  # PATCH/PUT /rins/1.json
  def update
    respond_to do |format|
      if @rin.update(rin_params)
        format.html { redirect_to @rin, notice: 'Rin was successfully updated.' }
        format.json { render :show, status: :ok, location: @rin }
      else
        format.html { render :edit }
        format.json { render json: @rin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rins/1
  # DELETE /rins/1.json
  def destroy
    @rin.destroy
    respond_to do |format|
      format.html { redirect_to rins_url, notice: 'Rin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rin
      @rin = Rin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rin_params
      params.require(:rin).permit(:measure, :date)
    end
end
