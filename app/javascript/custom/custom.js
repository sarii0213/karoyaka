document.addEventListener('DOMContentLoaded', () => {
    'use strict'

    //Global Variables
    let isPWA = true;  // Enables or disables the service worker and PWA
    let isAJAX = true; // AJAX transitions. Requires local server or server
    var pwaName = "Appkit"; //Local Storage Names for PWA
    var pwaRemind = 1; //Days to re-remind to add to home
    var pwaNoCache = false; //Requires server and HTTPS/SSL. Will clear cache with each visit

    //Setting Service Worker Locations scope = folder | location = service worker js location
    var pwaScope = "/";
    var pwaLocation = "/_service-worker.js";

    //Place all your custom Javascript functions and plugin calls below this line
    function init_template() {
        //Caching Global Variables
        var i, e, el; //https://www.w3schools.com/js/js_performance.asp

        //Back Button
        const backButton = document.querySelectorAll('[data-back-button]');
        if (backButton.length) {
            backButton.forEach(el => el.addEventListener('click', e => {
                e.stopPropagation;
                e.preventDefault;
                window.history.go(-1);
            }));
        }

        //File Upload
        const inputArray = document.getElementsByClassName('upload-file');
        if (inputArray.length) {
            inputArray[0].addEventListener('change', prepareUpload, false);

            function prepareUpload(event) {
                if (this.files && this.files[0]) {
                    var img = document.getElementById('image-data');
                    img.src = URL.createObjectURL(this.files[0]);
                }
                document.getElementsByClassName('upload-file-data')[0].classList.remove('disabled');
                if (document.getElementsByClassName('attached-image') != null) {
                    document.getElementsByClassName('attached-image')[0].classList.add('disabled');
                }
            }
        }
    }

    //Fix Scroll for AJAX pages.
    // if ('scrollRestoration' in window.history) window.history.scrollRestoration = 'manual';

    //End of Init Template
    // if(isAJAX === true){
    //     if(window.location.protocol !== "file:"){
    //         const options = {
    //             containers: ["#page"],
    //             cache:false,
    //             animateHistoryBrowsing: false,
    //             plugins: [
    //                 new SwupPreloadPlugin()
    //             ],
    //             linkSelector:'a:not(.external-link):not(.default-link):not([href^="https"]):not([href^="http"]):not([data-gallery])'
    //         };
    //         const swup = new Swup(options);
    //         document.addEventListener('swup:pageView',(e) => { init_template(); })
    //     }
    // }

    init_template();
});

