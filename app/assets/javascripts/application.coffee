#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  if $('#input').length > 0
    $input = $('#input')
    $input.elastic()
    $input.focus()

    inputDelay = 2000
    eraseDelay = 500
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
          data:
            hex: hex
            text: $input.val()

      eraseInterval = setInterval ( -> eraseWord($input) ), eraseDelay
