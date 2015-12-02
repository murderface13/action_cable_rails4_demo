class MessagesController < ApplicationController
  def create
    ActionCable.server.broadcast 'messages',
      message: params[:message][:message],
      user_id: params[:message][:user_id]

    render nothing: true, status: 204
  end
end
