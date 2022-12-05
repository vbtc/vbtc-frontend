#!/bin/bash

cd jsdev

echo "Building translations"

LANGUAGE=en_US sh generate_xtb.sh
LANGUAGE=es    sh generate_xtb.sh
LANGUAGE=pt_BR sh generate_xtb.sh
LANGUAGE=ro    sh generate_xtb.sh
LANGUAGE=zn_CN sh generate_xtb.sh
LANGUAGE=vi    sh generate_xtb.sh
exit


echo "Building javascript"

echo "default theme"
THEME=default sh build_templates.sh
LANGUAGE=en_US THEME=default sh build_js.sh
LANGUAGE=es    THEME=default sh build_js.sh
LANGUAGE=pt_BR THEME=default sh build_js.sh
LANGUAGE=ro    THEME=default sh build_js.sh
LANGUAGE=zn_CN THEME=default sh build_js.sh
LANGUAGE=vi    THEME=default sh build_js.sh

echo "coinage theme"
THEME=coinage sh build_templates.sh
LANGUAGE=en_US THEME=coinage sh build_release.sh
LANGUAGE=es    THEME=coinage sh build_js.sh
LANGUAGE=pt_BR THEME=coinage sh build_js.sh
LANGUAGE=ro    THEME=coinage sh build_js.sh
LANGUAGE=zn_CN THEME=coinage sh build_js.sh
LANGUAGE=vi    THEME=coinage sh build_js.sh

echo "ander theme"
THEME=ander sh build_templates.sh
LANGUAGE=en_US THEME=ander sh build_js.sh
LANGUAGE=es    THEME=ander sh build_js.sh
LANGUAGE=pt_BR THEME=ander sh build_js.sh
LANGUAGE=ro    THEME=ander sh build_js.sh
LANGUAGE=zn_CN THEME=ander sh build_js.sh
LANGUAGE=vi    THEME=ander sh build_js.sh

echo "whitedev theme"
THEME=whitedev sh build_templates.sh
LANGUAGE=en_US THEME=whitedev sh build_js.sh
LANGUAGE=es    THEME=whitedev sh build_js.sh
LANGUAGE=pt_BR THEME=whitedev sh build_js.sh
LANGUAGE=ro    THEME=whitedev sh build_js.sh
LANGUAGE=zn_CN THEME=whitedev sh build_js.sh
LANGUAGE=vi    THEME=whitedev sh build_js.sh

echo "done"
cd ../
