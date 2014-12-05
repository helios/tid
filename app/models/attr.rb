class Attr
  include Mongoid::Document
  include Sunspot::Mongoid2
  
  field :name, type: String
  field :type, type: String
  
  embedded_in :attr, :inverse_of => :attrs
 validates :name, format: { without: /\s/,  message: "not valid: no white spaces allowed" }
 validates :name, length: { minimum: 1, message: "not valid: please insert at least one caracter" }
 
  searchable do
    text :name
    text :type
end

end
