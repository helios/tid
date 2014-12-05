class Cell
 include Mongoid::Document
include Sunspot::Mongoid2
  
  field :label, type: String
  has_many :rna_forms, autosave: true
 
 searchable do
    text :label
end

end
