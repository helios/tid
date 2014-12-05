  
$ ->  
  generators = new Bloodhound(
    datumTokenizer: (d) ->  Bloodhound.tokenizers.whitespace d.name
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch:"/generators.json"
      
  )
  generators.initialize()

  
  $("#generator_refgenerators_ids_").tokenfield typeahead: [
    null
    {
      displayKey: "name"
      source: generators.ttAdapter()
    }
  ]
  
  $("#query_refgenerator").tokenfield typeahead: [
    null
    {
      displayKey: "name"
      source: generators.ttAdapter()
    }
  ]
  
  $("#query_generator").tokenfield typeahead: [
    null
    {
      displayKey: "name"
      source: generators.ttAdapter()
    }
    {
      displayKey: "notes"
      source: generators.ttAdapter()
    }
  ]
  
  return
