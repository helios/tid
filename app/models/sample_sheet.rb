class SampleSheet
  include Mongoid::Document
  include Sunspot::Mongoid2
  
  field :fcid, type: String
 
  
  
  #belongs_to :rna_folder, :inverse_of => :sample_sheets
  #has_and_belongs_to_many :documents
   embeds_many :sample_rows, cascade_callbacks: true
   
  
   
  
   accepts_nested_attributes_for :sample_rows,  reject_if: :all_blank, allow_destroy: true, :autosave => true
  
  
 searchable do
    text :fcid
    text :sample_rows_sampleId
    text :sample_rows_sampleRef
     text :sample_rows_index
     text :sample_rows_description
     text :sample_rows_control
     text :sample_rows_receipe
     text :sample_rows_operator
     text :sample_rows_sampleProject
    end
    
    def sample_rows_sampleId
    sample_rows.collect(&:sampleId).join(" ")
    end
    
     def sample_rows_sampleRef
    sample_rows.collect(&:sampleRef).join(" ")
    end
    
     def sample_rows_index
    sample_rows.collect(&:index).join(" ")
    end

    def sample_rows_description
    sample_rows.collect(&:description).join(" ")
    end
     def sample_rows_control
    sample_rows.collect(&:control).join(" ")
    end
     def sample_rows_receipe
    sample_rows.collect(&:receipe).join(" ")
    end
     def sample_rows_operator
    sample_rows.collect(&:operator).join(" ")
    end
     def sample_rows_sampleProject
    sample_rows.collect(&:sampleProject).join(" ")
    end
    

    





end

  
  

