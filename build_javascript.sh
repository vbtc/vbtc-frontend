#!/bin/bash

echo "Building javascript"
cd jsdev

echo "default theme"
THEME=default sh build_templates.sh
LANG=en_US THEME=default sh build_js.sh
LANG=es    THEME=default sh build_js.sh
LANG=pt_BR THEME=default sh build_js.sh
LANG=ro    THEME=default sh build_js.sh
LANG=zn_CN THEME=default sh build_js.sh
LANG=vi    THEME=default sh build_js.sh

echo "coinage theme"
THEME=coinage sh build_templates.sh
LANG=en_US THEME=coinage sh build_release.sh
LANG=es    THEME=coinage sh build_js.sh
LANG=pt_BR THEME=coinage sh build_js.sh
LANG=ro    THEME=coinage sh build_js.sh
LANG=zn_CN THEME=coinage sh build_js.sh
LANG=vi    THEME=coinage sh build_js.sh

echo "ander theme"
THEME=ander sh build_templates.sh
LANG=en_US THEME=ander sh build_js.sh
LANG=es    THEME=ander sh build_js.sh
LANG=pt_BR THEME=ander sh build_js.sh
LANG=ro    THEME=ander sh build_js.sh
LANG=zn_CN THEME=ander sh build_js.sh
LANG=vi    THEME=ander sh build_js.sh

echo "whitedev theme"
THEME=whitedev sh build_templates.sh
LANG=en_US THEME=whitedev sh build_js.sh
LANG=es    THEME=whitedev sh build_js.sh
LANG=pt_BR THEME=whitedev sh build_js.sh
LANG=ro    THEME=whitedev sh build_js.sh
LANG=zn_CN THEME=whitedev sh build_js.sh
LANG=vi    THEME=whitedev sh build_js.sh

echo "done"
cd ../
