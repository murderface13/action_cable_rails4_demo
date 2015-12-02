#= require cable

@App = {}
# App.cable = Cable.createConsumer 'ws://127.0.0.1/websocket'
App.cable = Cable.createConsumer 'ws://' + window.location.host + '/websocket'

$.each [0, 1, 2], (index, id) ->
  App.messages = App.cable.subscriptions.create 'MessagesChannel',
    received: (data) ->
      console.log(data)
      $chatContainer = $(".user_#{id}")
      $messageContainer = @renderMessage(data.message)
      $chatContainer.append $messageContainer
      $messageContainer.addClass('own') if id.toString() == data.user_id

    renderMessage: (message) ->
      $newLi = $("<li></li>")
      $newLi.html(message)
