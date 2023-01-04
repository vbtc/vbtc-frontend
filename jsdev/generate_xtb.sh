#!/usr/bin/env bash

#############################################
# set defaults if they're not provided
#############################################
LANGUAGE=${LANGUAGE:=en_US}

python2 ./closure-library/closure/bin/build/closurebuilder.py  \
  --root=./bitex \
  --root=./closure-library/ \
  --root=./closure-bootstrap/javascript/ \
  --root=./scottlogic/ \
  --root=./uniform/ \
  --root=./libphonenumber/i18n/phonenumbers/ \
  --root=./expression_evaluator/ \
  --namespace=bitex.app.BlinkTrade \
  --output_mode=compiled \
  --compiler_jar=./tools/XtbGenerator.jar \
  --compiler_flags="--lang=$LANGUAGE" \
  --compiler_flags="--translations_file=./translations/$LANGUAGE.xtb.xml" \
  --compiler_flags="--xtb_output_file=./translations/$LANGUAGE.xtb.xml"
