class GeneratorsController < ApplicationController
  before_action :set_generator, only: [:show, :edit, :update, :destroy]

  # GET /generators
  # GET /generators.json

    
def index
     @search = Sunspot.search Generator do
    fulltext params[:query_generator]
   end

  @generators = @search.results
  respond_to do |format|
    format.html
    format.json {    render :json => @generators.map(&:attributes) }
  end
end 

  # GET /generators/1
  # GET /generators/1.json
  def show
  end

  # GET /generators/new
  def new
    @generator = Generator.new
    @generator.attrs.build
  end

  # GET /generators/1/edit
  def edit
  end

  # POST /generators
  # POST /generators.json
  def create
    @generator = Generator.new(generator_params)
    create_scaffold
    respond_to do |format|
      if @generator.save
        format.html { redirect_to @generator, notice: 'Generator was successfully created.' }
        format.json { render :show, status: :created, location: @generator }
      else
        format.html { render :new }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generators/1
  # PATCH/PUT /generators/1.json
  def update
    respond_to do |format|
      if @generator.update(generator_params)
        format.html { redirect_to @generator, notice: 'Generator was successfully updated.' }
        format.json { render :show, status: :ok, location: @generator }
      else
        format.html { render :edit }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generators/1
  # DELETE /generators/1.json
  def destroy
    @generator.destroy
    respond_to do |format|
      format.html { redirect_to generators_url, notice: 'Generator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   def create_scaffold
    @model = Generator.new(generator_params)
    @name = @model.name
    @fields = @model.attrs.all  
    @command = "rails g scaffold #{@name} "
    @fields.each do |field|
        @command = @command + field.name + ":" + field.type + " "
      end
  
    @model.refgenerators_ids.first.split(', ').each do |refgenerator|
      if refgenerator.length >0
     @command = @command + " " + refgenerator + "_name:String" + " "
     end
    end 
    puts @command 
    system "bundle install --deployment"
  system @command
  end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_generator
      @generator = Generator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def generator_params
      params.require(:generator).permit(:name, :notes, attrs_attributes: [:id, :name, :type, :_destroy], 
      refgenerators_ids: [], refgenerators_names: [])
    end
end
