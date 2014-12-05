class Mdistantmetastasi
  include Mongoid::Document
       include Sunspot::Mongoid2
  field :name, type: String
  has_many :patients
  
  
  searchable do
    text :name     
end
end
