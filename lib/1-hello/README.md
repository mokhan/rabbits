# Hello World

This example is from the
[introduction](http://www.rabbitmq.com/tutorials/tutorial-one-ruby.html)
tutorial.

In this example the sender is publishing a message to the default
exchange to a queue named "hello".

The receiver is subscribing to all messages from the "hello" queue and
writing the body to the shell.

To send a message:

```bash
λ ruby lib/1-hello/send.rb 
   [x] Send 'hi'
```

To dequeue the message from the queue:

```bash
λ ruby lib/1-hello/receive.rb 
   [\*] Waiting for messages in hello. To exit press CTRL+C
   [x] Received hi
```
