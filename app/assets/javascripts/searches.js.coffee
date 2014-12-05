# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



  
  
  
$ -> 
  cell_types = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.label

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/cells.json"
  )
  cell_types.initialize()
  
  file_name = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.doc_file_name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/docs.json"
  )
  file_name.initialize()
  
  code = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.idCode
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/microrna_patients.json"
  )
  code.initialize()
  
  birth = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.datebirth
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/microrna_patients.json"
  )
  birth.initialize()
  
  comment = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.more
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/microrna_patients.json"
      filter: (list) ->
         $.map list, (doc) ->
           more: doc.more
  )
  comment.initialize()
  
  generators = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/generators.json"
  )
  generators.initialize()
  
  firstclassification = new Bloodhound(
    
    #remote: '/firstclassifications.json'
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10

    prefetch:
      url: "/firstclassifications.json"
      filter: (list) ->
        $.map list, (firstclassification) ->
          name: firstclassification.name
    
  )
  
  
  firstclassification.initialize()
    
  secondclassification = new Bloodhound(
    
    #remote: '/firstclassifications.json'
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10

    prefetch:
      url: "/secondclassifications.json"
      filter: (list) ->
        $.map list, (firstclassification) ->
          name: firstclassification.name
    
  )
  
  
  secondclassification.initialize()
 

 
  docres= new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.researcher

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      #ttl: 0
      url: "/docs.json"
      #ttl: '0'
      filter: (list) ->
        $.map list, (doc) ->
          researcher: doc.researcher
    
  )
  

  docres.initialize()
  
  file_types = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.label

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 3
    prefetch: "/file_types.json"
  )
  file_types.initialize()
  
  sample_sheets = new Bloodhound(
    datumTokenizer: (d) -> Bloodhound.tokenizers.whitespace d.fcid
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 3
    prefetch: "/sample_sheets.json"
  )
  
  sample_sheets.initialize()

  rnaid = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.rnaId)
      

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/rna_forms.json"
      filter: (list) ->
        $.map list, (doc) ->
          rnaId: doc.rnaId
  )
  rnaid.initialize()
  
  tag = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.tags)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/docs.json"
      filter: (list) ->
        $.map list, (doc) ->
          tags: doc.tags
  )
  tag.initialize()
  
  doccomment = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.comment)
      

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/docs.json"
      filter: (list) ->
        $.map list, (doc) ->
          comment: doc.comment
  )
  doccomment.initialize()
  

  microrna_patients = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.more

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/microrna_patients.json"
  )
  microrna_patients.initialize()
  
  grading = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/gradings.json"
  )
  grading.initialize()
  
  tprimarytumors = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/tprimarytumors.json"
  )
  tprimarytumors.initialize()
  
  
  nregionallymphnodes = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/nregionallymphnodes.json"
  )
  nregionallymphnodes.initialize()
  
  mdistantmetastasis = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/mdistantmetastasis.json"
  )
  mdistantmetastasis.initialize()
  
  histo = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.histology_number

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/patients.json"
  )
  histo.initialize()
  
  patientId = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.patient_id

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/patients.json"
  )
  patientId.initialize()
  
  rnaId = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.rnaId

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url:"/rna_forms.json"
      filter: (list) ->
        $.map list, (rna_form) ->
          rnaId: rna_form.rnaId
  )
  rnaId.initialize()
  
  rna_operator = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.operator

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url:"/rna_forms.json"
      filter: (list) ->
        $.map list, (rna_form) ->
          operator: rna_form.operator
  )
  rna_operator.initialize()

  
  rna_sampleIndex = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.sampleIndex

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url:"/rna_forms.json"
      filter: (list) ->
        $.map list, (rna_form) ->
          sampleIndex: rna_form.sampleIndex
  )
  rna_sampleIndex.initialize()
  
  sorting_date = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.sortingDate
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/rna_forms.json"
  )
  sorting_date.initialize()
 
  rna_sampleId = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.sampleId

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url:"/rna_forms.json"
      filter: (list) ->
        $.map list, (rna_form) ->
          sampleId: rna_form.sampleId
  )
  rna_sampleId.initialize()
 
  rna_isolationDate = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.isolationDate

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url:"/rna_forms.json"
      filter: (list) ->
        $.map list, (rna_form) ->
          isolationDate: rna_form.isolationDate
  )
  rna_isolationDate.initialize() 
  
  rna_sortingDate = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.sortingDate

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url:"/rna_forms.json"
      filter: (list) ->
        $.map list, (rna_form) ->
          sortingDate: rna_form.sortingsDate
  )
  rna_sortingDate.initialize() 
  
  rnaId_sr = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.sampleId)
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/sample_rows/sample_rows_all.json"
  )
  rnaId_sr.initialize()
  
  sampleOperator = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.operator)
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/sample_rows/sample_rows_all.json"
      filter: (list) ->
        $.map list, (sample_row) ->
          operator: sample_row.operator
  )
    
  
  sampleOperator.initialize()
    
  rna_isolation_date = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.rnaIsolationDate
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/rna_forms.json"
  )
  rna_isolation_date.initialize()
      
  sampleRef = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.sampleRef)
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/sample_rows/sample_rows_all.json"
  )
  sampleRef.initialize()
  
      
  sampleIndex = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.index)
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/sample_rows/sample_rows_all.json"
  )
  sampleIndex.initialize()
  
  sampleDescription = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.description)
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/sample_rows/sample_rows_all.json"
  )
  sampleDescription.initialize()
  
  rna_operator = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.operator

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url:"/rna_forms.json"
      filter: (list) ->
        $.map list, (rna_form) ->
          operator: rna_form.operator
  )
  rna_operator.initialize()

  
  
  sampleControl = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.control)
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/sample_rows/sample_rows_all.json"
  )
  sampleControl.initialize()
  
  
  sampleReceipe = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.receipe)
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/sample_rows/sample_rows_all.json"
  )
  sampleReceipe.initialize()
  
  
  sampleProject= new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.sampleProject)
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/sample_rows/sample_rows_all.json"
  )
  sampleProject.initialize()



  $("#query").tokenfield typeahead: [
    null
    {
      displayKey: "name"
      source: generators.ttAdapter()
    }
    {
      displayKey: "name"
      source: secondclassification.ttAdapter()
    }
   
    {
      displayKey: "label"
      source: cell_types.ttAdapter()
    }
    {
      displayKey: "label"
      source: file_types.ttAdapter()
    }
    {
      displayKey: "fcid"
      source: sample_sheets.ttAdapter()
    }
    {
      displayKey: "researcher"
      source: docres.ttAdapter()
    }
    {
      displayKey: "rnaId"
      source: rnaid.ttAdapter()
    }
    {
      displayKey: "tags"
      source: tag.ttAdapter()
    }
    {
      displayKey: "comment"
      source: doccomment.ttAdapter()
    }
    {
      displayKey: "name"
      source: firstclassification.ttAdapter()
    }
    {
      displayKey: "more"
      source: microrna_patients.ttAdapter()
    }
    {
      displayKey: "name"
      source: grading.ttAdapter()
    }
    {
      displayKey: "name"
      source: tprimarytumors.ttAdapter()
    }
    {
      displayKey: "name"
      source: nregionallymphnodes.ttAdapter()
    }
    {
      displayKey: "histology_number"
      source: histo.ttAdapter()
    }
    {
      displayKey: "patient_id"
      source: patientId.ttAdapter()
    }
    {
      displayKey: "rnaId"
      source: rnaId.ttAdapter()
    }
    {
      displayKey: "operator"
      source: rna_operator.ttAdapter()
    }
    {
      displayKey: "sampleIndex"
      source: rna_sampleIndex.ttAdapter()
    }
    {
      displayKey: "sampleId"
      source: rna_sampleId.ttAdapter()
    }
    {
      displayKey: "isolationDate"
      source: rna_isolationDate.ttAdapter()
    }
    {
      displayKey: "sortingDate"
      source: rna_sortingDate.ttAdapter()
    }
    {
      displayKey: "operator"
      source: sampleOperator.ttAdapter()
    }
    {
      displayKey: "sampleId"
      source: rnaId_sr.ttAdapter()
    }
    {
      displayKey: "sampleRef"
      source: sampleRef.ttAdapter()
    }
    {
      displayKey: "index"
      source: sampleIndex.ttAdapter()
    }
    {
      displayKey: "description"
      source: sampleDescription.ttAdapter()
    }
    {
      displayKey: "control"
      source: sampleControl.ttAdapter()
    }
    {
      displayKey: "receipe"
      source: sampleReceipe.ttAdapter()
    }
    {
      displayKey: "sampleProject"
      source: sampleProject.ttAdapter()
    }
    {
      displayKey: "notes"
      source: generators.ttAdapter()
    }
    {
      displayKey: "idCode"
      source: code.ttAdapter()
    }
    {
      displayKey: "datebirth"
      source: birth.ttAdapter()
    }
    {
      displayKey: "more"
      source: comment.ttAdapter()
    }
    {
      displayKey: "sortingDate"
      source: sorting_date.ttAdapter()
    }
    {
      displayKey: "rnaIsolationDate"
      source: rna_isolation_date.ttAdapter()
    }
	  {
      displayKey: "doc_file_name"
      source: file_name.ttAdapter()
    }
  ] 
   

  return