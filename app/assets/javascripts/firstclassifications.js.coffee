
$ ->
  first = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 5
    prefetch: "/firstclassifications.json"
  )
  first.initialize()
  
  second = new Bloodhound(
    remote: {
      url: '/secondclassifications.json'
    }

    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 5
    #prefetch: "/secondclassifications.json"
  )
  second.initialize()
  
    
  $("#query_classification").tokenfield typeahead: [
    hint: true
    highlight: true
    minLength: 2
    {
      displayKey: "name"
      source: first.ttAdapter()
    }
    {
      displayKey: "name"
      source: second.ttAdapter()
    }
  ]
  return
  