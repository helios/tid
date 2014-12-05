class NregionallymphnodesController < ApplicationController
  before_action :set_nregionallymphnode, only: [:show, :edit, :update, :destroy]

  # GET /nregionallymphnodes
  # GET /nregionallymphnodes.json
  def index
    @nregionallymphnodes = Nregionallymphnode.all
     respond_to do |format|
    format.html
    format.json {    render :json => @nregionallymphnodes.map(&:attributes) }
  end
  end


  # GET /nregionallymphnodes/1
  # GET /nregionallymphnodes/1.json
  def show
  end

  # GET /nregionallymphnodes/new
  def new
    @nregionallymphnode = Nregionallymphnode.new
  end

  # GET /nregionallymphnodes/1/edit
  def edit
  end

  # POST /nregionallymphnodes
  # POST /nregionallymphnodes.json
  def create
    @nregionallymphnode = Nregionallymphnode.new(nregionallymphnode_params)

    respond_to do |format|
      if @nregionallymphnode.save
        format.html { redirect_to @nregionallymphnode, notice: 'Nregionallymphnode was successfully created.' }
        format.json { render :show, status: :created, location: @nregionallymphnode }
      else
        format.html { render :new }
        format.json { render json: @nregionallymphnode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nregionallymphnodes/1
  # PATCH/PUT /nregionallymphnodes/1.json
  def update
    respond_to do |format|
      if @nregionallymphnode.update(nregionallymphnode_params)
        format.html { redirect_to @nregionallymphnode, notice: 'Nregionallymphnode was successfully updated.' }
        format.json { render :show, status: :ok, location: @nregionallymphnode }
      else
        format.html { render :edit }
        format.json { render json: @nregionallymphnode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nregionallymphnodes/1
  # DELETE /nregionallymphnodes/1.json
  def destroy
    @nregionallymphnode.destroy
    respond_to do |format|
      format.html { redirect_to nregionallymphnodes_url, notice: 'Nregionallymphnode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nregionallymphnode
      @nregionallymphnode = Nregionallymphnode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nregionallymphnode_params
      params[:nregionallymphnode].permit(:id, :name)
    end
end
