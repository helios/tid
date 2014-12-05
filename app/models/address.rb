class Address
  include Mongoid::Document
  include Sunspot::Mongoid2
  include Mongoid::Attributes::Dynamic
  field :street, type: String
  field :number, type: String
  field :model11_name, type: String
 searchable do
   text :street
    text :number
    text :model11_name
  
end
end
