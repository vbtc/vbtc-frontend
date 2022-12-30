#!/bin/bash

#############################################
# set defaults if they're not provided
#############################################
LANGUAGE=${LANGUAGE:=en_US}
THEME=${THEME:=default}

# BlinkTrade Application
python2 ./closure-library/closure/bin/build/closurebuilder.py  \
  --root=./closure-library/ \
  --root=./closure-bootstrap/javascript/ \
  --root=./scottlogic/ \
  --root=./uniform/ \
  --root=./libphonenumber/i18n/phonenumbers/ \
  --root=./expression_evaluator/ \
  --root=./bitex \
  --namespace=bitex.app.BlinkTrade \
  --output_mode=compiled \
  --compiler_jar=./tools/compiler.jar \
  --compiler_flags="--compilation_level=ADVANCED_OPTIMIZATIONS" \
  --compiler_flags="--define=goog.DEBUG=0" \
  --compiler_flags="--define=goog.LOCALE='$LANGUAGE'" \
  --compiler_flags="--externs=./externs/google.js" \
  --compiler_flags="--externs=./externs/plusone.js" \
  --compiler_flags="--externs=./externs/zopim.js" \
  --compiler_flags="--externs=./externs/jquery-1.9.js" \
  --compiler_flags="--externs=./externs/twitter-bootstrap.js" \
  --compiler_flags="--externs=./externs/google_analytics_api.js" \
  --compiler_flags="--externs=./externs/parsley.js" \
  --compiler_flags="--externs=./externs/jquerymobile-1.4.3.js" \
  --compiler_flags="--externs=./externs/sticky.js" \
  --compiler_flags="--externs=./externs/socket.io.js" \
  --compiler_flags="--externs=./externs/w3c_rtc.js" \
  --compiler_flags="--externs=./externs/facebook_javascript_sdk.js" \
  --compiler_flags="--externs=./externs/qrcode.js" \
  --compiler_flags="--translations_file=./translations/$LANGUAGE.xtb.xml" \
   > ../assets/js/bitex_app_blink_trade.compiled.$LANGUAGE.$THEME.js

# enable those flags to debug the compiled code.
#  --compiler_flags="--debug=TRUE" \
#  --compiler_flags="--formatting=PRETTY_PRINT" \
#  --compiler_flags="--formatting=PRINT_INPUT_DELIMITER" \
