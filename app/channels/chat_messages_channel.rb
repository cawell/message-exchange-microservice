class ChatMessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_messages_channel"
    ChatMessagesChannel.all_messages(Message.order(id: :desc).limit(20))
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_text(data)
    message = Message.create(content: data['message'], username: data['message'], color: data['message'], effect: data['message'])

    ActionCable.server.broadcast("chat_messages_channel", 
      message
    )
  end

  def self.send(data)
    ActionCable.server.broadcast("chat_messages_channel", 
      data
    )
  end

  def self.all_messages(messages)
    ActionCable.server.broadcast("chat_messages_channel", { history: messages})
  end
end