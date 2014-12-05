class Pathology
  include Mongoid::Document
  include Sunspot::Mongoid2
  
  field :name, type: String
  field :from, type: Date
  field :to, type: Date
  embedded_in :patient, :inverse_of => :pathologies
  
  searchable do
    text :name
   
end

end
