#!/bin/bash

#############################################
# set defaults if they're not provided
#############################################
THEME=${THEME:=default}

#############################################
# remove all compiled soy templates
#############################################
rm -rf ./bitex/templates/*.soy.js
rm -rf ./bitex/ui/*.soy.js
rm -rf ./bitex/view/*.soy.js

#############################################
# compile soy templates
#############################################
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
