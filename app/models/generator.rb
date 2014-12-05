class Generator
  include Mongoid::Document
  include Sunspot::Mongoid2
  include Mongoid::Attributes::Dynamic
  
  field :name, type: String
   field :notes, type: String
  
  
  embeds_many :attrs, cascade_callbacks: true
   has_and_belongs_to_many :generators, :class_name => 'Generator', :inverse_of => :refgenerators
  has_and_belongs_to_many :refgenerators, :class_name => 'Generator', :inverse_of => :generators

  accepts_nested_attributes_for :attrs, allow_destroy: true, :autosave => true
  
 validates :name, uniqueness: true
 validates :name, format: { without: /\s/,  message: "not valid: no white spaces allowed" }
 validates :name, length: { minimum: 1, message: "not valid: please insert at least one caracter" }
 validates :attrs, :presence => true
 
 
searchable do
    text :name
    text :notes
    text :refgenerators
    text :attr_name 
     
end


 def attr_name
    attrs.collect(&:name).join(" ")
  end
end 