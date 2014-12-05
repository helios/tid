class Model1sController < ApplicationController
  before_action :set_model1, only: [:show, :edit, :update, :destroy]

  # GET /model1s
  def index
    @search = Model1.search() do

	fulltext params[:query_model1s]
		end
	 @model1s = @search.results

  respond_to do |format|
    format.html
    format.json {    render :json => @model1s.map(&:attributes) }
  end
end
	
       


  # GET /model1s/1
  def show
  end

  # GET /model1s/new
  def new
    @model1 = Model1.new
    @model1 = Model1.new
    @model1 = Model1.new
  end

  # GET /model1s/1/edit
  def edit
  end

  # POST /model1s
  def create
    @model1 = Model1.new(model1_params)

    if @model1.save
      redirect_to @model1, notice: 'Model1 was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /model1s/1
  def update
    if @model1.update(model1_params)
      redirect_to @model1, notice: 'Model1 was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /model1s/1
  def destroy
    @model1.destroy
    redirect_to model1s_url, notice: 'Model1 was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model1
      @model1 = Model1.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def model1_params
      params.require(:model1).permit(:name, :surname)
    end
end
