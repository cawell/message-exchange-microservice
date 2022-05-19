class Message < ApplicationRecord
  # belongs_to :user
  after_create_commit {
    ChatMessagesChannel.send(self)
    puts "criado"
  }
end
