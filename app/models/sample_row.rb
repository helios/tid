class SampleRow
  include Mongoid::Document
  include Sunspot::Mongoid2
  
 # field :fcid, type: String
  field :sample_sheet_id, type: Integer
 # field :run_id, type: Integer
  
  field :lane, type: String
  field :sampleId, type: String
  field :sampleRef, type: String
  field :index, type: String
  field :description, type: String
  field :control, type: String
  field :receipe, type: String
  field :operator, type: String
  field :sampleProject, type: String
  
#  belongs_to :rna_folder, :inverse_of => :sample_rows
  embedded_in :sample_sheet, :inverse_of => :sample_rows
  
   
   searchable do
     text :sampleId
     text :sampleRef
     text :index
     text :description
     text :control
     text :receipe
     text :operator
     text :sampleProject
     
   end
  

  
  def self.to_csv ()
    CSV.generate do |csv|
        csv << [ "lane", "sample ID","Sample Ref", "Index", "Description", "Control", "Receipe", "Operator", "Sample project"]  
         all[0..7].each do |row|
          csv << [row.lane, row.sampleId, row.sampleRef, row.index, row.description, row.control, 
            row.operator, row.sampleProject]
         end
    end
   end 
    
    
    
end
