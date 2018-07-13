var webPage = require('webpage');
var pages = [];

/*
var id = '02';

target = {
  'url': 'https://projects.intra.42.fr/piscine-c-day-09-' + id + '/mine',
  'id': id
};
*/

var timeout = 20000;

var main_page = require('webpage').create();
console.log('User agent : ' + main_page.settings.userAgent);
main_page.open('https://intra.42.fr', function(status) {
    if (status !== 'success') {
      console.log('Unable to access');
    } else {
      console.log('Login Prompted ..')
        main_page.evaluate(function() {
          ilogin = document.getElementById('user_login');
          ipassw = document.getElementById('user_password');
          ilogin.value = 'USER_LOGIN';
          ipassw.value = 'HIDDENPASSWORD';
          signin_button = document.querySelector('input.btn.btn-login');
          signin_button.click();
        });
      setTimeout(function() {
        main_page.evaluate(function() {
          document.location.href = TARGET_URL;
        });
        setTimeout(function() {
          main_page.render('screen'+TARGET_ID+'.png');
          href = main_page.evaluate(function() {
            return document.querySelector('a[href$=".pdf"]').href;
          });
          console.log(href);
          phantom.exit();
        }, timeout);
      }, 6000);
    }
});

/*
   setTimeout(function() {
   page.evaluate(function() {
   document.location.href = 'https://projects.intra.42.fr/piscine-c-day-09-04/mine';
   });
   page.open();
   });
   */
