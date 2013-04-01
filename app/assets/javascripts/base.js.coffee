$(->
  call_facebook = (func) ->
    FB.getLoginStatus((response) ->
      if (response.status == 'connected')
        func()
      else if (response.status == 'not_authorized')
        FB.login( (response) ->
          if (response.authResponse)
            console.log('Welcome!  Fetching your information.... ');
            func()
          else
            console.log('User cancelled login or did not fully authorize.');
        ,{scope: 'email,user_likes,publish_actions'})
      else
        FB.login( (response) ->
          if (response.authResponse)
            console.log('Welcome!  Fetching your information.... ');
            func()
          else
            console.log('User cancelled login or did not fully authorize.');
        ,{scope: 'email,user_likes,publish_actions'})
      
    )
    
  $('#email-share').on('click', (event) -> 
    event.preventDefault()
    $('#new_share').show('slide')
  )
  
  $('#facebook-share').on('click', (event) -> 
    url = $(this).data('share-url')
    vent_id = $(this).data('vent-id')
    event.preventDefault()
    
    call_facebook( -> 
      FB.api('/me/ventitloud:share', 'post', { vent: url }, (response) ->
        $.ajax(
          url: "/vents/#{vent_id}/shares"
          type: "post"
          data: 
            network: "Facebook"
          dataType: "json"
        ).done( ->
          $('<div class="alert alert-success alert-block">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <h4>Success!</h4>
            You shared that vent on Facebook. Good for you!
          </div>').insertAfter($('#breadcrumbs'))
        )
        if (!response || response.error)
          console.log(response.error)
        else
          alert('Post ID: ' + response.id);
      )
    )
  )
  
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