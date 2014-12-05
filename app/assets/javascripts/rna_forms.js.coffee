# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  rna_id = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.rnaId

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/rna_forms.json"
  )
  rna_id.initialize()
  
  rna_operator = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.operator

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/rna_forms.json"
  )
  rna_operator.initialize()
  
  sorting_date = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.sortingDate
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/rna_forms.json"
  )
  sorting_date.initialize()
  
  rna_isolation_date = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.rnaIsolationDate
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/rna_forms.json"
  )
  rna_isolation_date.initialize()
    
  rna_sample = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.sampleId

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/rna_forms.json"
  )
  rna_sample.initialize()
  
  rna_index = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.sampleIndex

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/rna_forms.json"
  )
  rna_index.initialize()


  cell_types = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.label

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/cells.json"
  )
  cell_types.initialize()
  
  $("#doc_rna_forms_ids_").tokenfield typeahead: [
    null
    {
      displayKey: "rnaId"
      source: rna_id.ttAdapter()
    }
   ]

  
  $("#doc_samples_").tokenfield typeahead: [
    null
    {
      displayKey: "sampleId"
      source: rna_sample.ttAdapter()
    }
   ]

  $("#query_rnaId").tokenfield typeahead: [
    null
    {
      displayKey: "label"
      source: cell_types.ttAdapter()
    }
    {
      displayKey: "rnaId"
      source: rna_id.ttAdapter()
    }
    {
      displayKey: "sampleId"
      source: rna_sample.ttAdapter()
    }
    {
      displayKey: "sampleIndex"
      source: rna_index.ttAdapter()
    }
    {
      displayKey: "operator"
      source: rna_operator.ttAdapter()
    }
    {
      displayKey: "sortingDate"
      source: sorting_date.ttAdapter()
    }
    {
      displayKey: "rnaIsolationDate"
      source: rna_isolation_date.ttAdapter()
    }
   ] 
  
  return