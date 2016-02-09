#= require jquery
#= require jquery_ujs
#= require_tree .

$ ->
  $input = $('#input')
  delay = 5000

  $input.on('keyup', ->
    clearTimeout wipeTimer
    timer = setTimeout wipe, delay
  )

  $input.on('keydown', ->
    clearTimeout wipeTimer
  )

  wipe = ->
    # тут удалять написанное и отправляться аякс с текстом. в контроллере сохранять текст, если он длинее предыдущего
