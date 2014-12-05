class Rin
  include Mongoid::Document
    include Sunspot::Mongoid2
  field :measure, type: Float
  field :date, type: Date
  
  embedded_in :rna_form, :inverse_of => :rins
  
  searchable do
  text :date
     
end

end
