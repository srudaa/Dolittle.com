#!/bin/bash
cd ..
yarn
node ./node_modules/webpack/bin/webpack.js -p
chmod 400 ./dolittle_www_id_rsa
# git config core.sshCommand 'ssh -i ./dolittle_www_id_rsa' 
# git config --global user.name "Dolittle Automated Build"
# git config --global user.email "www@dolittle.com"
git clone git@github.com:dolittle/www.git
cp -R ./dist/* ./www 
cd ./www
git add .
git commit -m "<-- Autogenerated - Site updated -->"
git push
rm -rf www