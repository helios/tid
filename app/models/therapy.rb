class Therapy
  include Mongoid::Document
  include Sunspot::Mongoid2
  
  field :drug, type: String
  field :from, type: Date
  field :to, type: Date
  
  
  
  embedded_in :patient, :inverse_of => :therapies
  
  
 searchable do
    text :drug
end

  
end
