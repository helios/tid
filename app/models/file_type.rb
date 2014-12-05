class FileType
  include Mongoid::Document
  include Sunspot::Mongoid2
  
  field :label, type: String
  
   searchable do
    text :label
end

  
end
