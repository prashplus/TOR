# TOR

Tor is a service that helps you to protect your anonymity while using the Internet. Tor is comprised of two parts: software you can download that allows you to use the Internet anonymously, and the volunteer network of computers that makes it possible for that software to work.

When you use the Tor software, your IP address remains hidden and it appears that your connection is coming from the IP address of a Tor exit relay, which can be anywhere in the world. There are many reasons you might use Tor, including keeping websites from tracking you and your family members, using websites or services which are blocked in your country (for example, getting around the Great Firewall of China), and maintaining anonymity when communicating about socially sensitive information, such as health issues or whistleblowing.

The Tor software depends on the Tor network, which is made up of Tor relays operated by individuals and organizations all over the world. The more Tor relays we have running, the faster, more robust, and more secure the Tor network will be.

The Tor Challenge encourages people to run Tor relays. Working together, we can improve the network for everyone and protect the anonymity of Tor users all over the world.

## What is a TOR Relay?

Tor relays are also referred to as **routers** or **nodes.** They receive traffic on the Tor network and pass it along. Check out the Tor website for a more detailed explanation of how Tor works.

There are three kinds of relays that you can run in order to help the Tor network: middle relays, exit relays, and bridges.

For greater security, all Tor traffic passes through at least three **Relays** before it reaches its destination. The first two relays are middle relays which receive traffic and pass it along to another relay. Middle relays add to the speed and robustness of the Tor network without making the owner of the relay look like the source of the traffic. Middle relays advertise their presence to the rest of the Tor network, so that any Tor user can connect to them. Even if a malicious user employs the Tor network to do something illegal, the IP address of a middle relay will not show up as the source of the traffic. That means a middle relay is generally safe to run in your home, in conjunction with other services, or on a computer with your personal files. See our legal FAQ on Tor for more info.

An **Exit relay** is the final relay that Tor traffic passes through before it reaches its destination. Exit relays advertise their presence to the entire Tor network, so they can be used by any Tor users. Because Tor traffic exits through these relays, the IP address of the exit relay is interpreted as the source of the traffic. If a malicious user employs the Tor network to do something that might be objectionable or illegal, the exit relay may take the blame. People who run exit relays should be prepared to deal with complaints, copyright takedown notices, and the possibility that their servers may attract the attention of law enforcement agencies. If you aren't prepared to deal with potential issues like this, you might want to run a middle relay instead. We recommend that an exit relay should be operated on a dedicated machine in a hosting facility that is aware that the server is running an exit node. The Tor Project blog has these excellent tips for running an exit relay. See our legal FAQ on Tor for more info.

**Bridges** are Tor relays which are not publicly listed as part of the Tor network. Bridges are essential censorship-circumvention tools in countries that regularly block the IP addresses of all publicly listed Tor relays, such as China. A bridge is generally safe to run in your home, in conjunction with other services, or on a computer with your personal files.

## Setup

This repository will guide you to setup your own mini TOR Relay (for the shake of the good feeling that you contributed to the TOR network). The steps are very simple and prerequisites are given below.

### Prerequisites

1. Good Internet speed.

2. VM or Baremetal having Ubuntu (or any of your favorite linux flavor) installed.(Xenial - 16.04 will be appreciated)

3. Good Vibes ;)

### Steps

Go to the following lines in the **Sample Relay Script** and modify the code as per your need.

```bash
...
Nickname atlas
ContactInfo waydownwego(at)gmail(dot)com [tor-relay.co]
DirPort 9030
ExitPolicy reject *:*
RelayBandwidthRate 10 MBits
RelayBandwidthBurst 10 MBits
DisableDebuggerAttachment 0
ControlPort 9051
...
```

## Authors

* **Prashant Piprotar** - - [Prash+](https://github.com/prashplus)

Visit my blog for more Tech Stuff
### http://www.prashplus.com