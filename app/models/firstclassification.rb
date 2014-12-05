class Firstclassification
  include Mongoid::Document
  include Sunspot::Mongoid2
  
  field :name, type: String
  #field :secondclassification_id, type: Integer

  has_many :patients, autosave: true
  has_many :secondclassifications
  
 accepts_nested_attributes_for :secondclassifications, allow_destroy: true, :autosave => true

 searchable do
    text :name
end


end