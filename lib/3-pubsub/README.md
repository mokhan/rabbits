# [Publish/Subscribe](http://www.rabbitmq.com/tutorials/tutorial-three-ruby.html)

In this example we use a fanout exchange to deliver a single message to
multiple queues. This allows multiple services to subscribe to a single
fanout exchange and all receive the same message. This type of setup can be very useful for a
[CQRS](http://martinfowler.com/bliki/CQRS.html) style architecture.

This example uses a named fanout exchange called "logs". The queue that
is used to bind to the exchange does not have a name so RabbitMQ will
generate a unique name for the queue.

When a message is published to the exchange. The message will be
delivered to each subscriber queue. In this example the subscriber
queues are not durable, so the messages will be available in memory
until they are either processed or the server is restarted.

This allows subscribers to come online and "subscribe" to live messages
from the fanout exchange, then disconnect whenever they like without
affecting other services.

You can run as many subscribers as you like by starting a new shell and
running:

```bash
λ ruby lib/3-pubsub/subscriber.rb 
 [*] Waiting for logs. To exit press CTRL+C
```

When you send a message using the publisher. That message will be
delivered to all subscribers at once.

```bash
λ ruby lib/3-pubsub/publish.rb 
 [x] Sent Hello World!
```
