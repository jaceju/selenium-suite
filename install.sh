#!/bin/bash

## PhantomJS
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9CE6C37ED6243D66
sudo sh -c 'echo "deb http://ppa.launchpad.net/tanguy-patte/phantomjs/ubuntu trusty main" > /etc/apt/sources.list.d/phantomjs.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/tanguy-patte/phantomjs/ubuntu trusty main" >> /etc/apt/sources.list.d/phantomjs.list'

## Firefox
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F
sudo sh -c 'echo "deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu trusty main" >> /etc/apt/sources.list.d/mozilla-security.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu trusty main" >> /etc/apt/sources.list.d/mozilla-security.list'

## Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Update sources & Install package
echo "Install Xvfb and Browser..."
sudo apt-get -qq update
sudo apt-get -y -qq install \
    openjdk-7-jre \
    xfonts-100dpi xfonts-75dpi \
    xfonts-scalable xfonts-cyrillic \
    xvfb xserver-xorg-core \
    phantomjs \
    dbus-x11 firefox \
    google-chrome-stable

# ChromeDriver
echo "Install ChromeDriver..."
wget -N http://chromedriver.storage.googleapis.com/2.10/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
rm -f chromedriver_linux64.zip
chmod +x chromedriver
sudo mv chromedriver /usr/local/share/
sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

# Selenium Server
if [ ! -f "selenium-server-standalone-2.45.0.jar" ]; then
    wget http://selenium-release.storage.googleapis.com/2.45/selenium-server-standalone-2.45.0.jar
fi
