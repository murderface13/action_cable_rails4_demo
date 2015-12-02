class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
    puts '====== I AM SUBSCRIBED! ======'
  end
end