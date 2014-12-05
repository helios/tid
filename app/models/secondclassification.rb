class Secondclassification
  include Mongoid::Document
  include Sunspot::Mongoid2
  
  field :name, type: String
   field :firstclassification_id, type: Integer
   
 has_many :patients, autosave: true
 belongs_to :firstclassification
 
 searchable do
    text :name
end

end
