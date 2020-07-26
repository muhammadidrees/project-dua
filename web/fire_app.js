// Your web app's Firebase configuration
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
firebase.analytics();

const messaging = firebase.messaging()

messaging.usePublicVapidKey('BIu0QBsiFbD8NdpdsydrsecvxGq8LJlDkvMgPT-Ihn3c2QF3HToVzppW5z8VAddnA6FFx19gRtNKMXuyPexzK-Q');

messaging.getToken().then((currentToken) => {
    console.log(currentToken)
})