class SearchesController < ApplicationController
 def start
   
 end 
  def search
    m = Mongoid.models
    @models = [ ]
    m.each do |model|
@models << model
puts model
puts "ok"
end
  puts @models
  
     @search = Sunspot.search @models do
    fulltext params[:query]
                              
   end
  @results = @search.results
 
  respond_to do |format|
    format.html
    format.json {    render :json => @results.map(&:attributes) }
  end  
  end
  
    private 
     def get_mongoid_models
documents = []
Dir['{app,}/models/*.rb'].sort.each do |file|
model_path = file[0..-4].split('/')[2..-1]
 
begin
klass = model_path.map(&:classify).join('::').constantize
if klass.ancestors.include?(Mongoid::Document) && !klass.embedded
documents << klass
end
rescue => e
  puts documents
# Just for non-mongoid objects that dont have the embedded
# attribute at the class level.
end 
  
  end
end 
end
