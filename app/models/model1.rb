class Model1
  include Mongoid::Document
  include Sunspot::Mongoid2
  include Mongoid::Attributes::Dynamic
  field :name, type: String
  field :surname, type: String
 searchable do
   text :name
    text :surname
  
end
end
