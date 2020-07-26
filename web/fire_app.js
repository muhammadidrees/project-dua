importScripts("/__/firebase/7.17.1/firebase-app.js")
importScripts("/__/firebase/7.17.1/firebase-analytics.js")
importScripts('/__/firebase/7.17.1/firebase-messaging.js')
importScripts("/__/firebase/init.js")

const messaging = firebase.messaging()

messaging.getToken().then((currentToken) => {
    console.log(currentToken)
})