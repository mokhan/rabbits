# [Workers](http://www.rabbitmq.com/tutorials/tutorial-two-ruby.html)

This is an example of how to deliver messages to a worker queue. You can
spin up as many workers as you would like to process messages from a
single worker queue. 

This example works in much the same way as a [Delayed Job]() worker
queue would work.

It creates a durable queue that will persist between restarts. It is
also configured to manually send an ACK(noledgement) when the message is
successfully processed. This ensures that each message is processed.
Each worker is also configured to only receive a single message at a
time. This ensures that workers do not receive the next message until it
has finished processing the current one.

To run this example, you can start as many worker queues as you would
like:

```bash
λ ruby lib/2-workers/receive.rb 
 [*] Waiting for messages in task_queue. To exit press CTRL+C
```

To start sending messages:

```bash
λ ruby lib/2-workers/send.rb "BLAH"
 [x] Sent BLAH
```
