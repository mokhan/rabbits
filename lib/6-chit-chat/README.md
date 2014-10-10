# Chit Chat

This is a tiny little chat program, that shells out to 'say' to have
your computer convert to text to audio for you.

You can subscribe to all users in the topic exchange or specific users.
Queues are created using the name of the user logged in.

In order to use this, one person will have to act as the RabbitMQ host.

You will need to either export an environment variable to specify the
environment variable with each of the below commands.

```bash
$ export RABBIT_HOST=<servername>
```

To start the listener.

This will listen to all users on the exchange.

```bash
λ ruby lib/6-chit-chat/subscribe.rb 
 [*] Waiting for gossip from ["#"]. To exit press CTRL+C
```

You can specify specific routing keys to only listen to specific users.

```bash
λ ruby lib/6-chit-chat/subscribe.rb mo joe
 [*] Waiting for gossip from ["mo", "joe"]. To exit press CTRL+C
```

To start participating in the conversation you can start the REPL.

```bash
λ ruby lib/6-chit-chat/publish.rb
> 
```

Type your message and hit enter to publish the message to all connected
subscribers.
