App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    @perform 'appear'

  disconnected: ->

  received: (data) ->
    status = $('[class="user-status"][data= ' + data['message']['id'] + ']')

    status.find('.status').remove()

    if data['message']['appear'] == true
      status.append('<div class="status" style="background-color: deepskyblue;"></div>')

    if data['message']['appear'] == false
      status.append('<div class="status" style="background-color: white;"></div>')


  disappear: ->
    @perform 'disappear'

  appear: ->
    @perform 'appear'


$(document).on 'ready page:load', ->

  $('.logout_header').click ->
    App.appearance.disappear()

  idleTimer = null
  idleState = false
  idleWait = 300000

  $(document).bind 'mousemove', ->
    clearTimeout idleTimer
    if idleState == true
      App.appearance.appear()

    idleState = false
    idleTimer = setTimeout((->
      App.appearance.disappear()
      idleState = true), idleWait)
    $('body').trigger 'click'









