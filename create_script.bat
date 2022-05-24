@echo off
set /p scriptname="Script name: "
set /p scriptdescription="Script description: "
set /p githubrepo="Github repository (example: NickBlade/test): "
mkdir %scriptname%
echo fx_version 'adamant' > %scriptname%/fxmanifest.lua
echo game 'gta5' >> %scriptname%/fxmanifest.lua
echo description '%scriptdescription%' >> %scriptname%/fxmanifest.lua
echo version '1.0.0' >> %scriptname%/fxmanifest.lua
echo server_scripts { >> %scriptname%/fxmanifest.lua
echo 	'config.lua', >> %scriptname%/fxmanifest.lua
echo 	'server/main.lua' >> %scriptname%/fxmanifest.lua
echo } >> %scriptname%/fxmanifest.lua
echo client_scripts { >> %scriptname%/fxmanifest.lua
echo 	'config.lua', >> %scriptname%/fxmanifest.lua
echo 	'client/main.lua' >> %scriptname%/fxmanifest.lua
echo } >> %scriptname%/fxmanifest.lua

echo Config = {} > %scriptname%/config.lua

cd %scriptname%
mkdir client
mkdir server

cd client
copy NUL client.lua
cd ../server
copy NUL server.lua

cd ..
git init
git add *
git commit -m "Upload (standalone script)"
git branch -M main
git remote add origin git@github.com:%githubrepo%.git
git remote set-url origin https://github.com/%githubrepo%.git
git push -u origin main

