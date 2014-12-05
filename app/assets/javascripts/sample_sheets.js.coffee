# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  
  sample_sheets = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.fcid)
      
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/sample_sheets.json"
  )
  sample_sheets.initialize()
  
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
    prefetch: "/sample_rows/sample_rows_all.json"
  )
  sampleOperator.initialize()
    
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
  
  $("#doc_sample_sheets_ids_").tokenfield typeahead: [
    null
    {
      displayKey: "fcid"
      source: sample_sheets.ttAdapter()
    }
   ]
 
  
  $("#query_sample_sheet").tokenfield typeahead: [
    null
    {
      displayKey: "operator"
      source: sampleOperator.ttAdapter()
    }
    {
      displayKey: "sampleId"
      source: rnaId_sr.ttAdapter()
    }
    {
      displayKey: "fcid"
      source: sample_sheets.ttAdapter()
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
   
   
  ]
  return
    

