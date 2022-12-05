# Closure compiler information

The project was built for and includes closure compiler `Version: v20141120`
`Built on: 2014/11/21 15:12`

Compilation tasks and entry-points:

build_release.sh calls
* ./tools/SoyToJsSrcCompiler.jar
  * This script compiles .soy all files to javascript files for 
   only 1 specified theme, because all themes outputs the same file 
  names so building a new theme will just override an existing one
    * Output directory: ???
    * Output file name pattern: ??
* ./closure-library/closure/bin/build/closurebuilder.py
  * I believe this is the main compiler that outputs the final javascript files
  * It specifies all required libraries, the input and output directories
    * Libraries (also called externs):
      * google.js
      * plusone.js
      * zopim.js
      * jquery-1.9.js
      * twitter-bootstrap.js
      * google_analytics_api.js
      * parsley.js
      * jquerymobile-1.4.3.js
      * sticky.js
      * socket.io.js
      * w3c_rtc.js
      * facebook_javascript_sdk.js
      * qrcode.js
  * It also specifies and takes care of the translation files
    * translations/$LANG.xtb.xml
  * It sets the namespace
    * bitex.app.BlinkTrade\
  * It sets the input directories (called root):
    * ./closure-library/
    * ./closure-bootstrap/javascript/
    * ./scottlogic/
    * ./uniform/
    * ./libphonenumber/i18n/phonenumbers/
    * ./expression_evaluator/
    * ./bitex
  * Compilation level is set to `ADVANCED_OPTIMIZATIONS`
  * Final output is named:
    * `../assets/js/bitex_app_blink_trade.compiled.$LANG.$THEME.js`
  * Namespace is set to
    * `bitex.app.BlinkTrade`
  * `goog.LOCALE` is set to `'$LANG'`