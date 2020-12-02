class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.user.id == @chatroom.p1_id
      @recipient_id = @chatroom.p2_id
    else
      @recipient_id = @chatroom.p1_id
    end

    authorize @message
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        author_id: current_user.id,
        author_message: render_to_string(partial: "author_message", locals: { message: @message, author: true }),
        receiver_message: render_to_string(partial: "receiver_message", locals: { message: @message, author: false })
      )
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
      Notification.create(recipient: User.find(@recipient_id), actor: @message.user, action: "messaged", notifiable: @chatroom)
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
