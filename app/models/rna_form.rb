class RnaForm
  include Mongoid::Document
  include Sunspot::Mongoid2

  
  field :sortingDate, type: Date
  field :noCells, type: Integer
  field :cell_id, type: Integer
  field :noAliquots, type: Integer
  field :cellsPerAliquot, type: Integer
  field :purity, type: String
  field :volBufferPerAliquot, type: Float
  field :noAliquotsRnaIsolation, type: Integer
  field :rnaIsolationDate, type: Date
  field :rnaId, type: String
  field :volDilution, type: Float
  field :rnaConc, type: Float
  field :totalCells, type: Integer
  field :ngTotal, type: Float
  field :ngUsed, type: String
  field :ngavailable, type: Float
  
  field :operator, type: String
  field :sampleIndex, type: String
  field :sampleId, type: String
 
  
   
    belongs_to :cell, autosave: true

 # accepts_nested_attributes_for :documents, allow_destroy: true, :autosave => true
    
  embeds_many :rins, cascade_callbacks: true
  accepts_nested_attributes_for :rins, allow_destroy: true, :autosave => true
  
  validates :cell_id, :presence => true

   searchable do
    text :sortingDate
    text :purity
    text :rnaIsolationDate
    text :rnaId
    text :operator
    text :sampleId
    text :sampleIndex
    text :cell do
     cell.label
    end

    end
     
  

def available ()

ngavailable = ngTotal 
ngUsed.split('+').each  do |used|
ngavailable = ngavailable - used.to_f
end
self.ngavailable = ngavailable
end


  
 end
 


