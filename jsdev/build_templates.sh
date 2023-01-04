#!/usr/bin/env bash

#############################################
# remove all compiled soy templates
#############################################
rm -rf ./bitex/templates/*.soy.js
rm -rf ./bitex/ui/*.soy.js
rm -rf ./bitex/view/*.soy.js

#############################################
# set defaults if they're not provided
#############################################
THEME=${THEME:=default}

#############################################
# compile soy templates
#############################################
SOY_TEMPLATES="
               templates/templates
               ui/deposit_withdraw_button_group
               ui/bitex_datagrid
               ui/bitex_listview
               ui/order_book
               ui/order_manager
               ui/simple_chart
               ui/withdraw_methods
               ui/withdraw_method_editor
               ui/advanced_order_entry
               ui/simple_order_entry
               ui/market_view_table
               ui/change_password
               ui/algorithm_selector
               ui/algorithm_runner
               ui/locked_balance_display
               ui/remittance_box
               ui/api_key_data_entry
               ui/dialog
               ui/withdraw_request_data_entry
               ui/deposit_list
               ui/line_of_credit_table
               view/line_of_credit
               ui/card_data_entry
               ui/withdraw_list
               ui/two_factor
               ui/webcam_qr
               view/profile
               view/side_bar
               view/withdraw
"

for template in $SOY_TEMPLATES ; do
    echo -n "$template.$THEME.soy -> "
    java -jar ./tools/SoyToJsSrcCompiler.jar --bidiGlobalDir 1 --shouldGenerateGoogMsgDefs \
      --shouldProvideRequireSoyNamespaces --codeStyle concat --cssHandlingScheme GOOG  \
      --outputPathFormat  "./bitex/${template}.soy.js" \
      ./bitex/$template.$THEME.soy
    echo "$template.soy.js"
done

echo "done with soy templates"
