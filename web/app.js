function toggleTheme(theme) {
    // get favicon according to light or dark theme
    document.querySelector('#favicon').setAttribute('href', theme? '/favicon_dark.png' : '/favicon.png');
    // get manifest according to light or dark theme
    document.querySelector('#manifest').setAttribute('href', theme? '/manifest_dark.json' : '/manifest.json');
}

window.logger = (flutter_value) => {
   console.log({ js_context: this, flutter_value });
}
