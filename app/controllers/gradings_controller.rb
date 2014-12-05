class GradingsController < ApplicationController
  before_action :set_grading, only: [:show, :edit, :update, :destroy]

  # GET /gradings
  # GET /gradings.json
  def index
    @gradings = Grading.all
  end

  # GET /gradings/1
  # GET /gradings/1.json
  def show
  end

  # GET /gradings/new
  def new
    @grading = Grading.new
  end

  # GET /gradings/1/edit
  def edit
  end

  # POST /gradings
  # POST /gradings.json
  def create
    @grading = Grading.new(grading_params)

    respond_to do |format|
      if @grading.save
        format.html { redirect_to @grading, notice: 'Grading was successfully created.' }
        format.json { render :show, status: :created, location: @grading }
      else
        format.html { render :new }
        format.json { render json: @grading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gradings/1
  # PATCH/PUT /gradings/1.json
  def update
    respond_to do |format|
      if @grading.update(grading_params)
        format.html { redirect_to @grading, notice: 'Grading was successfully updated.' }
        format.json { render :show, status: :ok, location: @grading }
      else
        format.html { render :edit }
        format.json { render json: @grading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gradings/1
  # DELETE /gradings/1.json
  def destroy
    @grading.destroy
    respond_to do |format|
      format.html { redirect_to gradings_url, notice: 'Grading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grading
      @grading = Grading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grading_params
      params.require(:grading).permit(:id, :name)
    end
end
