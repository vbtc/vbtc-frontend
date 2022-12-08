#!/bin/bash

#############################################
# set defaults if they're not provided
#############################################
LANGUAGE=${LANGUAGE:=en_US}
THEME=${THEME:=default}


#############################################
# compile project
#############################################

OUTPUT_FILE=../assets/js/bitex_app_blink_trade.compiled.$LANGUAGE.$THEME.js

COMPILER_JAR_EXEC=../node_modules/.bin/google-closure-compiler
if [ -f "$COMPILER_JAR_EXEC" ]; then
  echo "Found compiler at $COMPILER_JAR_EXEC"
else
  COMPILER_JAR="../node_modules/google-closure-compiler/compiler.jar"
  if [ -f "$COMPILER_JAR" ]; then
    echo "Found compiler at $COMPILER_JAR"
    COMPILER_JAR_EXEC="java -jar $COMPILER_JAR"
  else
    echo "ERROR: Could not find compiler, exiting"
    exit
  fi
fi


echo "Compiling/Google Closure"
echo "  output_file: $OUTPUT_FILE"

# BlinkTrade Application
$COMPILER_JAR_EXEC \
  --js_output_file $OUTPUT_FILE \
  --js ../node_modules/google-closure-library/closure/goog/**.js \
  --js ../node_modules/google-closure-library/third_party/closure/goog/**.js \
  --js ./scottlogic/**.js \
  --js ./uniform/**.js \
  --js ./libphonenumber/i18n/phonenumbers/**.js \
  --js ./expression_evaluator/**.js \
  --js ./bitex/**.js \
  --js ./closure-bootstrap/javascript/**.js \
  --externs ./externs/google.js \
  --externs ./externs/plusone.js \
  --externs ./externs/zopim.js \
  --externs ./externs/jquery-1.9.js \
  --externs ./externs/twitter-bootstrap.js \
  --externs ./externs/google_analytics_api.js \
  --externs ./externs/parsley.js \
  --externs ./externs/jquerymobile-1.4.3.js \
  --externs ./externs/sticky.js \
  --externs ./externs/socket.io.js \
  --externs ./externs/facebook_javascript_sdk.js \
  --externs ./externs/qrcode.js \
  --define goog.DEBUG=0 \
  --define goog.LOCALE="$LANG" \
  --debug \
  --formatting=PRETTY_PRINT \
  --formatting=PRINT_INPUT_DELIMITER \
  --compilation_level ADVANCED_OPTIMIZATIONS



# Removed
#
#  --entry_point ./bitex/app/blinktrade \
#  not working, not a valid option
#  --translations_file ./translations/$LANGUAGE.xtb.xml \
#  libraries:
#  --externs ./externs/w3c_rtc.js \

# enable those flags to debug the compiled code.
#  --debug \
#  --formatting=PRETTY_PRINT \
#  --formatting=PRINT_INPUT_DELIMITER \


# inspiration, from compilation of libphonenumber
#
#${closure-compiler.jar}
#--output_wrapper=@{outputwrapper}
#--compilation_level=@{compilationlevel}
#--warning_level=VERBOSE
#--jscomp_error=accessControls
#--jscomp_error=checkDebuggerStatement
#--jscomp_error=checkRegExp
#--jscomp_error=checkTypes
#--jscomp_error=checkVars
#--jscomp_error=const
#--jscomp_error=constantProperty
#--jscomp_error=duplicate
#--jscomp_error=duplicateMessage
#--jscomp_error=es5Strict
#--jscomp_error=externsValidation
#--jscomp_error=extraRequire
#--jscomp_error=globalThis
#--jscomp_error=invalidCasts
#--jscomp_error=misplacedTypeAnnotation
#--jscomp_error=missingProperties
#--jscomp_error=missingRequire
#--jscomp_error=nonStandardJsDocs
#--jscomp_error=strictModuleDepCheck
#--jscomp_error=suspiciousCode
#--jscomp_error=typeInvalidation
#--jscomp_error=undefinedNames
#--jscomp_error=undefinedVars
#--jscomp_error=unknownDefines
#--jscomp_error=uselessCode
#--jscomp_error=visibility
