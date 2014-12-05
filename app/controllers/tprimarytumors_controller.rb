class TprimarytumorsController < ApplicationController
  before_action :set_tprimarytumor, only: [:show, :edit, :update, :destroy]

  # GET /tprimarytumors
  # GET /tprimarytumors.json
  def index
    @tprimarytumors = Tprimarytumor.all
     respond_to do |format|
    format.html
    format.json {    render :json => @tprimarytumors.map(&:attributes) }
  end
  end

  # GET /tprimarytumors/1
  # GET /tprimarytumors/1.json
  def show
  end

  # GET /tprimarytumors/new
  def new
    @tprimarytumor = Tprimarytumor.new
  end

  # GET /tprimarytumors/1/edit
  def edit
  end

  # POST /tprimarytumors
  # POST /tprimarytumors.json
  def create
    @tprimarytumor = Tprimarytumor.new(tprimarytumor_params)

    respond_to do |format|
      if @tprimarytumor.save
        format.html { redirect_to @tprimarytumor, notice: 'tprimarytumor was successfully created.' }
        format.json { render :show, status: :created, location: @tprimarytumor }
      else
        format.html { render :new }
        format.json { render json: @tprimarytumor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tprimarytumors/1
  # PATCH/PUT /tprimarytumors/1.json
  def update
    respond_to do |format|
      if @tprimarytumor.update(tprimarytumor_params)
        format.html { redirect_to @tprimarytumor, notice: 'tprimarytumor was successfully updated.' }
        format.json { render :show, status: :ok, location: @tprimarytumor }
      else
        format.html { render :edit }
        format.json { render json: @tprimarytumor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tprimarytumors/1
  # DELETE /tprimarytumors/1.json
  def destroy
    @tprimarytumor.destroy
    respond_to do |format|
      format.html { redirect_to tprimarytumors_url, notice: 'tprimarytumor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tprimarytumor
      @tprimarytumor = Tprimarytumor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tprimarytumor_params
      params.require(:tprimarytumor).permit(:id, :name)
    end
end
