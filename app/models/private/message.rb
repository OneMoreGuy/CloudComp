class Private::Message < ApplicationRecord
  self.table_name = 'private_messages'
  
  after_create_commit do
    prev_msg = previous_message
    Private::MessageBroadcastJob.perform_later(self, prev_msg)
  end
  
  belongs_to :user
  belongs_to :conversation, 
             class_name: 'Private::Conversation',
             foreign_key: :conversation_id

  def previous_message
    previous_message_index = self.conversation.messages.index(self) - 1
    return self.conversation.messages[previous_message_index]
  end
end
