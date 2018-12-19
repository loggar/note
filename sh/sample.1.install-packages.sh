#! /usr/bin/env bash

echo "Installing all the things..."

if [ -f "package.json" ]; then
	echo "Installing npm requirements..."
	npm install
fi

if [ -f ".bowerrc" ]; then
	echo "Installing bower packages..."
	bower install
fi

if [ -f "composer.json" ]; then
	echo "Installing composer packages..."
	composer install
fi

echo "Finished installing."
