importScripts('/__/firebase/7.17.1/firebase-app.js');
importScripts('/__/firebase/7.17.1/firebase-analytics.js');
importScripts('/__/firebase/7.17.1/firebase-messaging.js');
importScripts('/__/firebase/init.js');

const messaging = firebase.messaging();

messaging.usePublicVapidKey('BIu0QBsiFbD8NdpdsydrsecvxGq8LJlDkvMgPT-Ihn3c2QF3HToVzppW5z8VAddnA6FFx19gRtNKMXuyPexzK-Q');

messaging.getToken().then((currentToken) => {
    console.log(currentToken)
})