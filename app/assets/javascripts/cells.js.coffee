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
 
  


  $("#query_cells").tokenfield typeahead: [
    null
    {
      displayKey: "label"
      source: cell_types.ttAdapter()
    }
   ] 
  
  return