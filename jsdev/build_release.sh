#!/bin/bash

#############################################
# remove all compiled soy templates
#############################################
rm -rf ./bitex/templates/*.soy.js
rm -rf ./bitex/ui/*.soy.js

#############################################
# set defaults if they're not provided
#############################################
LANG="en_US"
THEME=${THEME:=default}

#############################################
# compile soy templates
#############################################
#echo java -jar ./tools/soy-2022-10-26-SoyToJsSrcCompiler.jar \
#       --bidiGlobalDir 1 --shouldGenerateGoogMsgDefs \
#       --outputPathFormat "{INPUT_DIRECTORY}/{INPUT_FILE_NAME_NO_EXT}.js" \
#       --srcs bitex/ui/deposit_withdraw_button_group.$THEME.soy

java -jar ./tools/soy-2022-10-26-SoyToJsSrcCompiler.jar \
  --bidiGlobalDir 1 \
  --shouldGenerateGoogMsgDefs \
  --outputPathFormat "{INPUT_DIRECTORY}/{INPUT_FILE_NAME_NO_EXT}.soy.js" \
  --srcs bitex/templates/templates.$THEME.soy,\
bitex/ui/deposit_withdraw_button_group.$THEME.soy,\
bitex/ui/bitex_datagrid.$THEME.soy,\
bitex/ui/bitex_listview.$THEME.soy,\
bitex/ui/order_book.$THEME.soy,\
bitex/ui/order_manager.$THEME.soy,\
bitex/ui/simple_chart.$THEME.soy,\
bitex/ui/withdraw_methods.$THEME.soy,\
bitex/ui/withdraw_method_editor.$THEME.soy,\
bitex/ui/advanced_order_entry.$THEME.soy,\
bitex/ui/simple_order_entry.$THEME.soy,\
bitex/ui/market_view_table.$THEME.soy,\
bitex/ui/change_password.$THEME.soy,\
bitex/ui/algorithm_selector.$THEME.soy,\
bitex/ui/algorithm_runner.$THEME.soy,\
bitex/ui/locked_balance_display.$THEME.soy,\
bitex/ui/remittance_box.$THEME.soy,\
bitex/ui/api_key_data_entry.$THEME.soy,\
bitex/ui/dialog.$THEME.soy,\
bitex/ui/withdraw_request_data_entry.$THEME.soy,\
bitex/ui/deposit_list.$THEME.soy,\
bitex/ui/line_of_credit_table.$THEME.soy,\
bitex/view/line_of_credit.$THEME.soy,\
bitex/ui/card_data_entry.$THEME.soy,\
bitex/ui/withdraw_list.$THEME.soy,\
bitex/ui/two_factor.$THEME.soy,\
bitex/ui/webcam_qr.$THEME.soy,\
bitex/view/profile.$THEME.soy,\
bitex/view/side_bar.$THEME.soy,\
bitex/view/withdraw.$THEME.soy

echo "done with soy templates"

#############################################
# compile project
#############################################

../node_modules/.bin/google-closure-compiler  \
  --js_output_file ../assets/js/bitex_app_blink_trade.compiled.$LANG.$THEME.js \
  --js ../node_modules/google-closure-library/closure/goog/**.js \
  --js ../node_modules/google-closure-library/third_party/closure/goog/**.js \
  --js ./scottlogic/ \
  --js ./uniform/ \
  --js ./libphonenumber/i18n/phonenumbers/ \
  --js ./expression_evaluator/ \
  --js ./bitex \
  --entry_point goog:bitex.app.BlinkTrade \
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
  --define goog.LOCALE=$LANG \
  --compilation_level ADVANCED_OPTIMIZATIONS



# Removed
#
#  not working, not a valid option
#  --translations_file ./translations/$LANG.xtb.xml \
#  libraries:
#  --js ./closure-bootstrap/javascript/ \
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
