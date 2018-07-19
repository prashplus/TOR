RELEASE='xenial'
IS_EXIT=false
INSTALL_ARM=true

cat << "EOF"


 _____            ___     _
|_   _|__ _ _ ___| _ \___| |__ _ _  _   __ ___
  | |/ _ \ '_|___|   / -_) / _` | || |_/ _/ _ \
  |_|\___/_|     |_|_\___|_\__,_|\_, (_)__\___/
                                 |__/

              [Relay Setup]
This script will ask for your sudo password.
----------------------------------------------------------------------
EOF

echo "Adding apt repository..."
sudo touch /etc/apt/sources.list.d/tor.list
echo "deb http://deb.torproject.org/torproject.org $RELEASE main" | sudo tee /etc/apt/sources.list.d/tor.list > /dev/null
echo "deb-src http://deb.torproject.org/torproject.org $RELEASE main" | sudo tee --append /etc/apt/sources.list.d/tor.list > /dev/null

echo "Adding GPG key..."
gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 > /dev/null
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add - > /dev/null

echo "Updating package list..."
sudo apt-get -y update > /dev/null

echo "Installing NTP..."
sudo apt-get -y install ntpdate > /dev/null
sudo ntpdate pool.ntp.org > /dev/null

if $INSTALL_ARM
then
  echo "Installing ARM..."
  sudo apt-get -y install tor-arm > /dev/null
fi

echo "Installing Tor..."
sudo apt-get -y install tor deb.torproject.org-keyring > /dev/null

echo "Setting Tor config..."
cat << 'EOF' | sudo tee /etc/tor/torrc > /dev/null
SocksPort 0
RunAsDaemon 1
ORPort 9001
Nickname atlas
ContactInfo waydownwego(at)gmail(dot)com [tor-relay.co]
DirPort 9030
ExitPolicy reject *:*
RelayBandwidthRate 10 MBits
RelayBandwidthBurst 10 MBits
DisableDebuggerAttachment 0
ControlPort 9051
CookieAuthentication 1

EOF

if $IS_EXIT
then
  echo "Downloading Exit Notice to /etc/tor/tor-exit-notice.html..."
  echo "Please edit this file and replace FIXME_YOUR_EMAIL_ADDRESS with your e-mail address!"
  echo "Also note that this is the US version. If you are not in the US please edit the file and remove the US-Only sections!"
  sudo wget -q -O /etc/tor/tor-exit-notice.html "https://raw.githubusercontent.com/flxn/tor-relay-configurator/master/misc/tor-exit-notice.html"
fi

sleep 10

echo "Reloading Tor config..."
sudo killall -s SIGHUP tor

echo "Setup finished"
echo "----------------------------------------------------------------------"
echo "Tor will now check if your ports are reachable. This may take up to 20 minutes."
echo "Check /var/log/tor/log for an entry like:"
echo "\"Self-testing indicates your ORPort is reachable from the outside. Excellent.\""
echo "----------------------------------------------------------------------"
#sleep 5
#tail -f /var/log/tor/log
