App.chat = App.cable.subscriptions.create "ChatChannel",

  connected: ->

  disconnected: ->

  received: (data) ->

    room_id = Number($('.chat').attr('id'))
    current_user_id = Number($('.chat').attr('user-id'))
    current_user_email = $('.header').attr('current-user')
    recipient_user_email = $('.header').attr('recipient')

    if room_id == data['message']['room_id']
      if data['message']['user_id'] == current_user_id
        $('.message-block').append('<div class="current-user-message">' + current_user_email + '</div> ' +
          '<div class="curr-msg-cont">' + data['message']['content'] + '</div>')
        $('.form-control').val("")
      else
        $('.message-block').append('<div class="recipient-message">' + recipient_user_email + '</div> ' +
            '<div class="res-msg-cont">' + data['message']['content'] + '</div>')
        $('.form-control').val("")










