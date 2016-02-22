#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  if $('#input').length > 0
    $input = $('#input')
    $saved = $('.saved')
    $input.elastic()
    $input.focus()
    $saved.hide()

    inputDelay = 3000
    eraseDelay = 300
    fadeOutDelay = 1000
    eraseInterval = 0
    eraseTimeout = 0
    hex = Math.random().toString(36).substring(2)

    eraseWord = ($input) ->
      text = $input.val().trim()
      lastIndex = text.lastIndexOf(' ')
      $input.val(text.substring(0, lastIndex))

    $input.on('keydown', (event) ->
      clearInterval eraseInterval
      clearTimeout eraseTimeout
      eraseTimeout = setTimeout eraseInput, inputDelay
    )

    eraseInput = ->
      if $input.val().trim().length > 0
        $.ajax
          method: 'POST'
          url: '/tides'
          dataType: 'json'
          data:
            hex: hex
            text: $input.val().trim()
          success: (response) ->
            if response.status == 'ok' && (response.message == 'saved' || response.message == 'updated')
              $saved.show().fadeOut(fadeOutDelay)
            else if response.status == 'error'
              $saved.css('color', 'red').text('FATAL ERROR').show()
              redirectTimeout = setTimeout ( -> document.location.href="/" ), fadeOutDelay * 2

      eraseInterval = setInterval ( -> eraseWord($input) ), eraseDelay
