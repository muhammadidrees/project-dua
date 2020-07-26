importScripts("/__/firebase/7.17.1/firebase-app.js")
importScripts('/__/firebase/7.17.1/firebase-messaging.js')
importScripts("/__/firebase/init.js")

const messaging = firebase.messaging()

messaging.setBackgroundMessageHandler(function (payload) {
    title = payload.title;
    options = {
        body: payload.body,
        icon: '/images/icons/icon-512x512.png',
        badge: '/images/icons/icon-128x128.png'
    };
    return self.registration.showNotification(title, options);
});