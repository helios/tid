class Tprimarytumor
  include Mongoid::Document
    include Sunspot::Mongoid2
  
  field :name, type: String
  
  has_many :patients, autosave: true
  
  searchable do
    text :name
  end
end
