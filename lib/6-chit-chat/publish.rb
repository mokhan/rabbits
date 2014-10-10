#!/usr/bin/env ruby
## encoding: utf-8

require "bunny"

connection = Bunny.new(host: ENV.fetch('RABBIT_HOST', 'localhost'))
connection.start

channel = connection.create_channel
exchange = channel.topic("chitchat")
username = `'whoami'`.chomp!

begin
  print "> "
  while message = gets do
    exchange.publish(message, routing_key: username)
    puts " [x] Sent #{username}:#{message}"
    print "> "
  end
rescue
  connection.close
end

