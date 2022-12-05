# Build systems, linters, etc

Builders:
* Closure Soy Builder
* Closure compiler
* Jekyll


Linters:
* Javascript Linting
  * Set to Ecmascript 6+
* Closure Linter 
  * IDEA plugin, deprecated
  * There is a new java based linter described here:
https://github.com/google/closure-compiler/wiki/Lint-checks
It can be installed manually by running 
`mvn install -DskipTests -pl com.google.javascript:closure-compiler-linter`
Requires maven. Maven requires Java 19.