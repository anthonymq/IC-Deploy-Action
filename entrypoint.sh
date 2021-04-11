#!/bin/sh -l

echo Creating deployer directory

mkdir ~/.config
mkdir ~/.config/dfx
mkdir ~/.config/dfx/identity
mkdir ~/.config/dfx/identity/default

echo Adding identity.pem and wallets file file

echo $INPUT_IDENTITY > ~/.config/dfx/identity/default/identity.pem
sed -i 's/\\r\\n/\r\n/g' ~/.config/dfx/identity/default/identity.pem
echo $INPUT_WALLETS > ~/.config/dfx/identity/default/wallets.json

echo "Deploying to the IC"

dfx canister --network=ic create --all
dfx build --network=ic
dfx canister --network=ic install --all -m reinstall
