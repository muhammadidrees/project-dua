importScripts("https://www.gstatic.com/firebasejs/7.17.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.17.1/firebase-messaging.js");

var firebaseConfig = {
    apiKey: "AIzaSyDDkzqv71V8xnzCSrAg7zhIDMbW0GoU6Ek",
    authDomain: "duas-pwa.firebaseapp.com",
    databaseURL: "https://duas-pwa.firebaseio.com",
    projectId: "duas-pwa",
    storageBucket: "duas-pwa.appspot.com",
    messagingSenderId: "335624904391",
    appId: "1:335624904391:web:c4f02df03dd23b0feae8e2",
    measurementId: "G-00N5TQCWN9"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging()

messaging.setBackgroundMessageHandler(function (payload) {
    title = payload.title;
    options = {
        body: payload.body,
        icon: '/images/icons/icon-512x512.png',
        badge: '/images/icons/icon-128x128.png'
    };
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification(title, options);
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});