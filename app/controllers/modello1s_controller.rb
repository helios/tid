class Modello1sController < ApplicationController
  before_action :set_modello1, only: [:show, :edit, :update, :destroy]

  # GET /modello1s
  def index
    @search = Modello1.search() do

	fulltext params[:query_modello1s]
		end
	 @modello1s = @search.results

  respond_to do |format|
    format.html
    format.json {    render :json => @modello1s.map(&:attributes) }
  end
end
	
       


  # GET /modello1s/1
  def show
  end

  # GET /modello1s/new
  def new
    @modello1 = Modello1.new
    @modello1 = Modello1.new
    @modello1 = Modello1.new
  end

  # GET /modello1s/1/edit
  def edit
  end

  # POST /modello1s
  def create
    @modello1 = Modello1.new(modello1_params)

    if @modello1.save
      redirect_to @modello1, notice: 'Modello1 was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /modello1s/1
  def update
    if @modello1.update(modello1_params)
      redirect_to @modello1, notice: 'Modello1 was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /modello1s/1
  def destroy
    @modello1.destroy
    redirect_to modello1s_url, notice: 'Modello1 was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modello1
      @modello1 = Modello1.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def modello1_params
      params.require(:modello1).permit(:first, :name)
    end
end
