class Doc
  include Mongoid::Document
  include Mongoid::Paperclip
  include Sunspot::Mongoid2
  include Mongoid::Attributes::Dynamic

 
  field :file_type_id, type: Integer
  field :researcher, type: String
  field :date, type: Date
  field :comment, type: String
  field :tags, type: String
  field :samples, type: Array
  field :rna_forms_ids, type: Array
  field :sample_sheets_ids, type: Array
    
 has_and_belongs_to_many :rna_forms
 has_and_belongs_to_many :sample_sheets
 
  #accepts_nested_attributes_for :rna_forms
  

  
  belongs_to :file_type
  has_mongoid_attached_file :doc 
  do_not_validate_attachment_file_type :doc
validates :file_type_id, :presence => true


 searchable do
    text :researcher
    text :comment
    text :tags
    text :date
    text :rna_forms_ids
    text :sample_sheets_ids
    text :samples
	text :doc_file_name
    text :fileType_label do
      file_type.label
    end

   end
  

end



  


  