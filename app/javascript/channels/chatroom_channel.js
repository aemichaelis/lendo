import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        if (messagesContainer.dataset.userId == data.author_id) {
          messagesContainer.insertAdjacentHTML('beforeend', data.author_message);
        } else {
          messagesContainer.insertAdjacentHTML('beforeend', data.receiver_message);
        }
      },
    });
    console.log(consumer.subscriptions)
  }
}

export { initChatroomCable };
