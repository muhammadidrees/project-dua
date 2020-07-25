function toggleTheme(theme) {
    // set favicon according to light or dark theme
    document.querySelector('#favicon').setAttribute('href', theme? '/favicon_dark.png' : '/favicon.png');
    // set apple app icon according to theme
    document.querySelector('#apple_icon').setAttribute('href', theme? 'images/dark_icons/icon-192x192.png' : 'images/icons/icon-192x192.png') 
    // set manifest according to light or dark theme
    document.querySelector('#manifest').setAttribute('href', theme? '/manifest_dark.json' : '/manifest.json');
}

window.logger = (flutter_value) => {
   console.log({ js_context: this, flutter_value });
}
