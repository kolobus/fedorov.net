---
layout: post
title: Hello world
comments: true
---

Hey, it's alive!

{% highlight yml %}
komodo:
  image: kolobus/komodo:beta
  volumes:
    - /mnt/komodo:/komodo/.komodo
    - /mnt/zcash-params:/komodo/.zcash-params
  entrypoint: komodod -pubkey=0390ff85f4015983e1aecbcdb2669f7e5d156a8690dd2c595d1a67a8e55f3edb0e
  container_name: komodo
  restart: always

heartbeat:
  image: kolobus/komodo:beta
  volumes:
    - /mnt/heartbeat:/komodo/.komodo
    - /mnt/zcash-params:/komodo/.zcash-params
  entrypoint: komodod -disablewallet=1 -pubkey=03b7621b44118017a16043f19b30cc8a4cfe068ac4e42417bae16ba460c80f3828
  container_name: heartbeat
  restart: always

heartbeat-www:
  image: nginx:alpine
  volumes:
    - /mnt/heartbeat/www:/usr/share/nginx/html:ro
  ports:
    - 10.10.0.5:80:80
  container_name: heartbeat-www
  restart: always

bitcoin:
  image: kolobus/bitcoind:latest
  volumes:
    - /mnt/bitcoin:/bitcoin/.bitcoin
  container_name: bitcoin
  restart: always

shitcoin:
  image: kolobus/komodo:beta
  ports:
    - 10.10.0.5:13503:13503
  volumes:
    - /mnt/komodo:/komodo/.komodo
    - /mnt/zcash-params:/komodo/.zcash-params
  entrypoint: komodod -pubkey=0390ff85f4015983e1aecbcdb2669f7e5d156a8690dd2c595d1a67a8e55f3edb0e -ac_name=SHITCOIN -ac_supply=10000000 -gen -genproclimit=1
  container_name: shitcoin
{% endhighlight %}
