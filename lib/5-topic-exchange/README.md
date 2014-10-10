# [Topic Exchanges](http://www.rabbitmq.com/tutorials/tutorial-five-ruby.html)

In this example we publish and subscribe to a topic exchange.
Which gives us if more granularity with the type of messages we
subscribe to.

Topic Exchanges allows us to specify routing keys in form of:

```ruby
"canada.alberta.calgary"
"canada.alberta.*"
"canada.#"
```

* \* to substitute exactly one word.
* # to substitue zero or more words

To publish:

```bash
λ ruby lib/4-topic-exchange/publish.rb git.error 'just kidding'
 [x] Sent 'blah'
λ ruby lib/4-topic-exchange/publish.rb vim.warning 'too good'
 [x] Sent 'blah'
```

To subscribe:

```bash
λ ruby lib/5-topic-exchange/subscribe.rb vim.warning
 [*] Waiting for logs. To exit press CTRL+C
 [x] vim.warning:too good
```
or 
```bash
λ ruby lib/5-topic-exchange/subscribe.rb git.#
 [*] Waiting for logs. To exit press CTRL+C
 [x] git.error:just kidding
```
