$(->
  
  $(".live-search").on('focus', (event) ->
    $(event.target).autocomplete({
      source: $(event.target).data("url"),
      minLength: 2,
      open: (event, ui) ->
        $(".ui-autocomplete").addClass("typeahead").addClass("dropdown-menu")
    })
  )
  
  $('time.convert').each( ->
    try $(this).text(Date.parse($(this).text()).addHours(-(new Date().getTimezoneOffset()/60)).toString("MM/dd/yyyy hh:mm tt")) catch e
  )

)