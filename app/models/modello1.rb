class Modello1
  include Mongoid::Document
  include Sunspot::Mongoid2
  include Mongoid::Attributes::Dynamic
  field :first, type: String
  field :name, type: String
 searchable do
   text :first
    text :name
  
end
end
