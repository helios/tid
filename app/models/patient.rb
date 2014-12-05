class Patient
  include Mongoid::Document
  include Sunspot::Mongoid2
  
  field :histology_number, type: String
  field :patient_id, type: String
  field :date_of_birth, :type => Date
  field :gender, type: String
  field :smoker, type: Boolean
  field :date_of_biopsy, :type =>Date
  field :distance, type: Float
  field :firstclassification_id, type: Integer
  field :secondclassification_id, type: Integer 

  #field :is_a, type:String
  #field :ontology, type:String
  
  belongs_to :firstclassification, autosave: true
  belongs_to :secondclassification, autosave: true
  belongs_to :grading, autosave: true
  belongs_to :nregionallymphnode, autosave: true
  belongs_to :tprimarytumor, autosave: true
  belongs_to :mdistantmetastasi, autosave: true
  
  
  embeds_many :therapies,  cascade_callbacks: true
  embeds_many :pathologies, cascade_callbacks: true
  
  accepts_nested_attributes_for :therapies, allow_destroy: true, :autosave => true
  accepts_nested_attributes_for :pathologies, allow_destroy: true, :autosave => true

  validates :histology_number, :presence => true
  validates :firstclassification_id, :presence => true
  validates :secondclassification_id, :presence => true
  validates :grading, :presence => true
  validates :nregionallymphnode, :presence => true
  validates :tprimarytumor, :presence => true
  validates :mdistantmetastasi, :presence => true

 
  
 searchable do
    text :histology_number
    text :patient_id
    text :date_of_biopsy
    text :date_of_birth
    text :therapies_drug
    text :pathologies_name
    text :firstclassification do 
        firstclassification.name
    end
    text :secondclassification do 
      secondclassification.name
    end
    text :nregionallymphnode do 
      nregionallymphnode.name
    end
    text :grading do 
      grading.name
    end
    text :tprimarytumor do 
      tprimarytumor.name
    end
    text :mdistantmetastasi do 
      mdistantmetastasi.name
    end

end


  def therapies_drug
    therapies.collect(&:drug).join(" ")
  end

def pathologies_name
  pathologies.collect(&:name).join(" ")
end

end
