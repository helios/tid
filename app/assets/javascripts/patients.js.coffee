# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#nav').on 'click', ->
  history.go(0)
  
$(document).ready -> 
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).parent().remove()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    (this).closest('fieldset').hide()

jQuery ->
  secondclassifications = $('#patient_secondclassification_id').html()
  $('#patient_firstclassification_id').change ->
    firstclassification = $('#patient_firstclassification_id :selected').text()
    escaped_first = firstclassification.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(secondclassifications).filter("optgroup[label='#{escaped_first}']").html()
    if options
      $('#patient_secondclassification_id').html(options)
    else
       $('#patient_secondclassification_id').empty()
         
$ ->
  firstclassifcations = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/firstclassifications.json"
  )
  firstclassifcations.initialize()
  
  second = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name

    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/secondclassifications.json"
  )
  second.initialize()
  
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
 
  histo_code = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.histology_number
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/patients.json"
  )
  histo_code.initialize()
  
  patient_id = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.patient_id
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/patients.json"
  )
  patient_id.initialize()
  
  birth = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.date_of_birth
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/patients.json"
  )
  birth.initialize()  
  
  date_biopsy = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.date_of_biopsy
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/patients.json"
  )
  date_biopsy.initialize() 
  
  therapies = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.drug
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: 
      url: "/patients.json"
      filter: (data) ->
        console.log("data", data.patient.therapies)
        $.map data.patient.therapies, (therapy) ->
          drug: therapy.drug     
  )
  therapies.initialize() 
    
  pathologies = new Bloodhound(
    datumTokenizer: (d) ->
      Bloodhound.tokenizers.whitespace d.name
    queryTokenizer: Bloodhound.tokenizers.whitespace
    limit: 10
    prefetch: "/patients.json"
  )
  pathologies.initialize() 
  
  $("#query_patients").tokenfield typeahead: [
    null
    {
      displayKey: "name"
      source: firstclassifcations.ttAdapter()
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
      displayKey: "name"
      source: second.ttAdapter()
    }
    {
      displayKey: "name"
      source: mdistantmetastasis.ttAdapter()
    }
    {
      displayKey: "therapies"
      source: therapies.ttAdapter()
    }
    {
      displayKey: "drug"
      source: pathologies.ttAdapter()
    }
    {
      displayKey: "histology_number"
      source: histo_code.ttAdapter()
    }
    {
      displayKey: "patient_id"
      source: patient_id.ttAdapter()
    }
    {
      displayKey: "date_of_birth"
      source: birth.ttAdapter()
    }
    {
      displayKey: "date_of_biopsy"
      source: date_biopsy.ttAdapter()
    }
  ]
  
 
  return
  
