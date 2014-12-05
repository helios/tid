# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  
  file_types = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.label

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 3
    prefetch: "/file_types.json"
  )  
  file_types.initialize()  
  
  file_name = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.doc_file_name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 3
    prefetch: "/docs.json"
  )  
  file_name.initialize() 
 
  
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
  
  sampleid = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.sampleId)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/rna_forms.json"
      filter: (list) ->
        $.map list, (doc) ->
          sampleId: doc.sampleId
  )
  sampleid.initialize()
  
  tag = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.tags)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/docs.json"
  )
  tag.initialize()
 
  researcher = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.researcher)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/docs.json"
  )
  researcher.initialize()
 
  comment = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.comment)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/docs.json"
  )
  comment.initialize()
  
  date = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.date)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/docs.json"
  )
  date.initialize()
  
  file_name = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace(d.doc_file_name)
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/docs.json"
  )
  file_name.initialize()
  
  
  
  $("#doc_tags").tokenfield typeahead: [
    hint: true
    highlight: true
    minLength: 1
    ,
    {
      displayKey: "tags"
      source: tag.ttAdapter()
    }
   ]
   
  $("#query_docs").tokenfield typeahead: [
    hint: true
    highlight: true
    minLength: 1
    ,
    {
      displayKey: "label"
      source: file_types.ttAdapter()
    }
    {
      displayKey: "fcid"
      source: sample_sheets.ttAdapter()
    }
    {
      displayKey: "sampleId"
      source: sampleid.ttAdapter()
    }
    {
      displayKey: "rnaId"
      source: rnaid.ttAdapter()
    }
    {
      displayKey: "doc_file_name"
      source: file_name.ttAdapter()
    }
    {
      displayKey: "tags"
      source: tag.ttAdapter()
    }
    {
      displayKey: "researcher"
      source: researcher.ttAdapter()
    }
    {
      displayKey: "comment"
      source: comment.ttAdapter()
    }
    {
      displayKey: "date"
      source: date.ttAdapter()
    }
	  {
      displayKey: "doc_file_name"
      source: file_name.ttAdapter()
    }
  ]
  
  return