#!/opt/homebrew/bin/zsh

#######################################################################
# This script creates a TypeScript Node project that uses ES modules. #
#######################################################################

# Variables used

cwd=${PWD##*/} # current cwd
red="\033[31m" # color code for red
green="\033[0;32m" # color code for green
yellow="\033[0;33m" # color code for yellow
none="\033[0m" # color code for no color
outDir="./dist" #tsc output direcrory
include="./src/**/*" #tsc input glob
src="src"
dist="dist"

echo "${yellow}*** creating project $PWD ***${none}"
echo ""

# package.json

echo "${green}* initializing Node project $PWD *${none}"

 
echo '{' > package.json
echo '  "name": "'${cwd}'",' >> package.json
echo '  "type": "module",' >> package.json
echo '  "version": "1.0.0",' >> package.json
echo '  "description": "",' >> package.json
echo '  "main": "'${outDir}'/index.js",' >> package.json
echo '  "scripts": {' >> package.json
echo '    "test": "echo \"Error: no test specified\" && exit 1",' >> package.json
echo '    "watch": "tsc -w -strict",' >> package.json
echo '    "start": "node dist/index.js"' >> package.json
echo '  },' >> package.json
echo '  "keywords": [],' >> package.json
echo '  "author": "'${USER}'",' >> package.json
echo '  "license": "ISC"' >> package.json
echo '}' >> package.json

echo "${green}* adding development dependencies $PWD *${none}"
npm install -D @types/jest
npm install -D @types/node
npm install -D @typescript-eslint/eslint-plugin
npm install -D @typescript-eslint/parser
npm install -D eslint
npm install -D eslint-config-recommended
npm install -D eslint-plugin-import
npm install -D eslint-plugin-node
npm install -D eslint-plugin-promise
npm install -D eslint-plugin-standard
npm install -D jest
npm install -D preact
npm install -D preact-render-to-string
npm install -D typescript

echo ''

# Eslint/Typescript Configuration
echo "${green}* creating .eslintrc.json $PWD *${none}"
touch .eslintrc.json
echo '{' > .eslintrc.json
echo '    "root": true,' >> .eslintrc.json
echo '    "parser": "@typescript-eslint/parser",' >> .eslintrc.json
echo '    "plugins": [' >> .eslintrc.json
echo '         "@typescript-eslint",' >> .eslintrc.json
echo '         "@typescript-eslint/eslint-plugin"' >> .eslintrc.json
echo '    ],' >> .eslintrc.json
echo '    "env": {' >> .eslintrc.json
echo '        "browser": true,' >> .eslintrc.json
echo '        "node": true,' >> .eslintrc.json
echo '        "commonjs": false,' >> .eslintrc.json
echo '        "es2021": true,' >> .eslintrc.json
echo '        "jest": true' >> .eslintrc.json
echo '    },' >> .eslintrc.json
echo '    "extends": [' >> .eslintrc.json
echo '        "eslint:recommended",' >> .eslintrc.json
echo '        "plugin:@typescript-eslint/recommended"' >> .eslintrc.json
echo '    ],' >> .eslintrc.json
echo '    "rules": {' >> .eslintrc.json
echo '        "quotes": [2, "double"],' >> .eslintrc.json
echo '        "no-unused-expressions": 0,' >> .eslintrc.json
echo '        "@typescript-eslint/no-unused-vars": 1,' >> .eslintrc.json
echo '        "comma-dangle": [2, "always-multiline"],' >> .eslintrc.json
echo '        "semi": [2, "always"],' >> .eslintrc.json
echo '        "indent": [2, 4],' >> .eslintrc.json
echo '        "arrow-parens": [2, "as-needed"],' >> .eslintrc.json
echo '        "eol-last": 0,' >> .eslintrc.json
echo '        "no-multiple-empty-lines": [2, { "max": 1, "maxBOF": 0, "maxEOF": 0 }],' >> .eslintrc.json
echo '        "strict": [2, "global"],' >> .eslintrc.json
echo '        "no-prototype-builtins": 0' >> .eslintrc.json
echo '    }' >> .eslintrc.json
echo '}' >> .eslintrc.json

echo "${green}* creating .eslintignore $PWD *${none}"
touch .eslintignore
echo 'node_modules' > .eslintignore
echo 'dist' >> .eslintignore

echo "${green}* creating tsconfig.json $PWD *${none}"
touch tsconfig.json
echo '{' > tsconfig.json
echo '    "compilerOptions": {' >> tsconfig.json
echo '        "module": "ES2020",' >> tsconfig.json
echo '        "moduleResolution": "Node",' >> tsconfig.json
echo '        "outDir": "'${outDir}'",' >> tsconfig.json
echo '        "allowJs": false,' >> tsconfig.json
echo '        "target": "es2021",' >> tsconfig.json
echo '        "strict": true,' >> tsconfig.json
echo '        "jsx": "react-jsx",' >> tsconfig.json
echo '        "jsxImportSource": "preact",' >> tsconfig.json
echo '        "noImplicitAny": true' >> tsconfig.json
echo '    },' >> tsconfig.json
echo '    "include": ["'${include}'"]' >> tsconfig.json
echo '}' >> tsconfig.json

# Create Directory Structure Matching tsconfig.json
echo "${green}* creating \"src" and \"dist" directories *${none}"
mkdir ${src}
mkdir ${dist}

# Git

echo "${green}* Creating .gitignore $PWD *${none}"
touch .gitignore
echo 'node_modules' > .gitignore
echo 'dist' >> .gitignore

echo ''
echo "${green}* commiting project $PWD *${none}"
git init
git add .
git commit -m 'Initial commit.'

# Done
echo ""
echo "${yellow}*** project $PWD created ***${none}"
echo ""
