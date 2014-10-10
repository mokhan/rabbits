# [Routing](http://www.rabbitmq.com/tutorials/tutorial-four-ruby.html)

In this example we us a direct exchange to route specific types of
messages to specific queues. A direct exchange named "direct_logs" is
created. When subscribers come oneline they register with the direct
exchange for specific types of messages.

In this example, each subscriber to can register for one of the
following severity levels: info, warning or error.

This allows subscribers to select which types of message they wish to
process based on a routing key (info, warning, error).

This time when you start the subscriber, you will need to specify the
routing key to bind to.

```bash
λ ruby lib/4-routing/subscribe.rb warning
 [*] Waiting for logs. To exit press CTRL+C
 [x] warning:blah
```

When you publish a message you will need to specify the routing key to
use or else it will default to 'info'.

```bash
λ ruby lib/4-routing/publish.rb error blah
 [x] Sent 'blah'
```

In the above example the routing key 'error' was used. So that message
will not be delivered to our subscriber that was bound the to 'warning'
routing key.

To deliver a message to the subscriber of the 'warning' routing key we
need to send a message using the 'warning' routing key.

```bash
λ ruby lib/4-routing/publish.rb warning 'no need for alarm'
 [x] Sent 'blah'
```
