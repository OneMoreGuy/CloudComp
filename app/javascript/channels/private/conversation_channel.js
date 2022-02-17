import consumer from "../consumer"

consumer.private_conversation = consumer.subscriptions.create("Private::ConversationChannel", {
    connected() {
    	console.log("test");
    },
    
    disconnected() {
    
    },
    
    received(data) {
    
    },
    
    send_message: function(message) {
    	return this.perform('send_message', {
        	message: message
    	});
    }
});

$(document).on('submit', '.send-private-message', function(e) {
    e.preventDefault();
    var values = $(this).serializeArray();
    consumer.private_conversation.send_message(values);
    $(this).trigger('reset');
});
