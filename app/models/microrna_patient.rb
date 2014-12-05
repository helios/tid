class MicrornaPatient
  include Mongoid::Document
  include Sunspot::Mongoid2
  
  
  field :idCode, type: String
  field :datebirth, :type => Date
  field :gender, type: String
  field :addpain, type: Boolean
  field :artalgia, type: Boolean
  field :artrite, type: Boolean
  field :more, type: String
  field :stick, type: Boolean
  field :urin, type: Boolean
  field :microrna, type: Boolean
  field :dna, type: Boolean
  

  embeds_many :pathologicalurins, cascade_callbacks: true
  embeds_many :stickurins, cascade_callbacks: true
  
  accepts_nested_attributes_for :pathologicalurins, allow_destroy: true, :autosave => true
  accepts_nested_attributes_for :stickurins, allow_destroy: true, :autosave => true
  


  
   searchable do
    text :idCode
    text :more
    boolean :microrna
    boolean :dna
end
  
end
