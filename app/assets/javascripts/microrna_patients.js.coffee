# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready -> 

  $('#urin_test').hide()
  $('#microrna_patient_urin').change ->
    test = $('#microrna_patient_urin :selected').text()
    if test == "SI"
          $('#urin_test').show();
    else 
       $('#urin_test').hide()
      
      
       jQuery ->
  $('#urin_stick').hide()
  $('#microrna_patient_stick').change ->
    test = $('#microrna_patient_stick :selected').text()
    if test == "SI"
          $('#urin_stick').show();
    else 
       $('#urin_stick').hide()
      
$ ->
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
  

  $("#query_microrna_patient").tokenfield typeahead: [
    hint: true
    highlight: true
    minLength: 1
    ,
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
   ]
  return
  