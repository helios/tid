class SecondclassificationsController < ApplicationController
  def create
    @firstclassification = Firstclassification.find(params[:firstclassification_id])
    @secondclassification = @firstclassification.secondclassifications.create!(secondclassification_params)
    redirect_to @firstclassification, :notice => ""  
  end
  
  def new
    
  end
  
  def edit
    
  end
  
  def index
    
    @search = Secondclassification.search do
    fulltext params[:query_classification]
   end

  @classifications = @search.results
  respond_to do |format|
    format.html
    format.json {    render :json => @classifications.map(&:attributes) }
  end
end 

  
 

  private
def secondclassification_params
      params.require(:secondclassification).permit(:id, :name, :_destroy)
    end
end

