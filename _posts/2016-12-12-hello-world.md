---
title: Hello world
redirect_from: "/blog/2016"
---

Hey, it's alive!

Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

![Lorem Pixel](https://images.weserv.nl/?url=lorempixel.com%2F680%2F420){:class="img-responsive"}

And code...

{% highlight yml %}
heartbeat:
  image: kolobus/komodo:beta
  volumes:
    - /mnt/heartbeat:/komodo/.komodo
    - /mnt/zcash-params:/komodo/.zcash-params
  entrypoint: komodod -disablewallet=1 -pubkey=...
  container_name: heartbeat
  restart: always

heartbeat-www:
  image: nginx:alpine
  volumes:
    - /mnt/heartbeat/www:/usr/share/nginx/html:ro
  ports:
    - 10.x.x.x:80:80
  container_name: heartbeat-www
  restart: always

bitcoin:
  image: kolobus/bitcoind:latest
  volumes:
    - /mnt/bitcoin:/bitcoin/.bitcoin
  container_name: bitcoin
  restart: always
{% endhighlight %}
