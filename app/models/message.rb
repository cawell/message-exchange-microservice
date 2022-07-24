# frozen_string_literal: true

class Message < ApplicationRecord
  # belongs_to :user
  after_create_commit do
    ChatMessagesChannel.send(self)
    puts 'criado'
  end
end
