import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    let el = document.createElement('div');

    if (el.getElementsByClassName('recently_updated').length > 0) {
      el.innerHTML = data.html;
      el.getElementsByClassName('recently_updated')[0].classList.add('line-item-highlight');
      document.getElementsByTagName('main')[0].innerHTML = el.innerHTML;
    } else {
      document.getElementsByTagName('main')[0].innerHTML = data.html;
    }
  }
});
